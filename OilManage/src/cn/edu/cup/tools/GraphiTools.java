package cn.edu.cup.tools;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.eclipse.draw2d.geometry.Rectangle;
import org.eclipse.draw2d.graph.DirectedGraph;
import org.eclipse.draw2d.graph.DirectedGraphLayout;
import org.eclipse.draw2d.graph.Edge;
import org.eclipse.draw2d.graph.Node;

import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;

import com.realpersist.gef.layout.NodeJoiningDirectedGraphLayout;

public class GraphiTools {

	public Map<String,Node> NodeMap = null;

	public Graphi graphi;
	DirectedGraph directedGraph = null;
	public Graphi calcXY(Graphi g){
		// 解析数据，构造图
		graphi=g;
		NodeMap = new HashMap();
		directedGraph = new DirectedGraph();
		//GraphModel model = new DefaultGraphModel();
		//graph.setModel(model);
		//Map attributes = new Hashtable();
		/// Set Arrow
		//Map edgeAttrib = new Hashtable();
		//GraphConstants.setLineEnd(edgeAttrib, GraphConstants.ARROW_CLASSIC);
		//GraphConstants.setEndFill(edgeAttrib, true);
		//graph.setJumpToDefaultPort(true);
		
		Iterator<Line> edgeBeanIt = g.getLines().iterator();
		while (edgeBeanIt.hasNext()) {
			Line edge=edgeBeanIt.next();
			Point sourceAction = g.getPoint(edge.getStart());
			Point targetAction = g.getPoint(edge.getEnd());
			
			String edgeString = "(20)";
			addEdge(sourceAction, targetAction, 20, edgeString);
		}
		if(directedGraph.edges.size()!=0){
		// 自动布局 首先用DirectedGraphLayout如果出现异常（图不是整体连通的）则采用NodeJoiningDirectedGraphLayout
		// 后者可以对非连通图进行布局坐标计算，但效果不如前者好，所以首选前者，当前者不可以处理时采用后者
		try{
			new DirectedGraphLayout().visit(directedGraph);
		}catch(Exception e1){
			new NodeJoiningDirectedGraphLayout().visit(directedGraph);
		}
		}
		applyGraphResults();
		return g;
	}
	/**
	 * 利用布局后的有向图里节点的位置信息重新定位画布上的图元
	 * @param graph
	 * @param map
	 */
	protected void applyGraphResults() {
		int base=10;
		Iterator<String> names=graphi.getPoints().keySet().iterator();
		int i=10;
	    for (;names.hasNext();) {
	        String name = names.next();
	        Node n = NodeMap.get(name);
	        Point t=graphi.getPoint(name);
	        if(n!=null){
	        t.setDraw2DX(n.y+100);
	        base=base+10;
	        t.setDraw2DY(n.x);
	        }else{
	        	  t.setDraw2DX(500+base+i);
	  	        i=i+10;
	  	        t.setDraw2DY(500+base);	
	        }
	        
	    }
	}
	public static void updateGraphi(Graphi g){
		new GraphiTools().calcXY(g);
	}
	/**
	 * @param source
	 * @param target
	 */
	private void addEdge(Point source, Point target, int weight,String edgeString) {

		if (source == null || target == null) {
			return;
		}
		if (NodeMap == null) {
			NodeMap = new HashMap();
		}		
		if (directedGraph == null) {
			directedGraph = new DirectedGraph();
			
		}

		// 建立GEF的 node edge将来用来计算graph node的layout
		addEdgeGef(source, target,weight,edgeString);
		
/*		// 建立真正要用的graph的 node edge
		Point sourceNode = null;
		Point targetNode = null;
		sourceNode = (Point) graphNodeMap.get(source);
		if (sourceNode == null) {
			sourceNode = new DefaultGraphCell(source);
			sourceNode.addPort();
			graphNodeMap.put(source, sourceNode);
		}
		targetNode = (DefaultGraphCell) graphNodeMap.get(target);
		if (targetNode == null) {
			targetNode = new DefaultGraphCell(target);
			targetNode.addPort();
			graphNodeMap.put(target, targetNode);
		}
		DefaultEdge edge = new DefaultEdge(edgeString);
		UnionEdge unionEdge = new UnionEdge();
		unionEdge.setEdge(edge);
		unionEdge.setSourceNode(sourceNode);
		unionEdge.setTargetNode(targetNode);

		edgeList.add(unionEdge);*/

	}

	/**
	 * @param source
	 * @param target
	 * @param weight
	 * @param edgeString
	 */
	private void addEdgeGef(Point source, Point target, int weight, String edgeString) {

		if(source.equals(target)){
			return;
		}
		// 建立GEF的 node edge将来用来计算graph node的layout
		Node gefSourceNode = null;
		Node gefTargetNode = null;
		gefSourceNode = (Node) NodeMap.get(source.getName());
		if (gefSourceNode == null) {
			gefSourceNode = new Node();
			gefSourceNode.width = 100;
			gefSourceNode.height = 80;
			//gefSourceNode.setPadding(new Insets(GraphProp.NODE_TOP_PAD,GraphProp.NODE_LEFT_PAD, GraphProp.NODE_BOTTOM_PAD,GraphProp.NODE_RIGHT_PAD));
			directedGraph.nodes.add(gefSourceNode);
			NodeMap.put(source.getName(), gefSourceNode);
		}
		
		gefTargetNode = (Node) NodeMap.get(target.getName());
		if (gefTargetNode == null) {
			gefTargetNode = new Node();
			gefSourceNode.width = 100;
			gefSourceNode.height = 80;
			//gefTargetNode.setPadding(new Insets(GraphProp.NODE_TOP_PAD,GraphProp.NODE_LEFT_PAD, GraphProp.NODE_BOTTOM_PAD,GraphProp.NODE_RIGHT_PAD));
			directedGraph.nodes.add(gefTargetNode);
			NodeMap.put(target.getName(), gefTargetNode);
		}
		
		Edge gefEdge1=null;
		try{
			gefEdge1 = new Edge(gefSourceNode, gefTargetNode);
			gefEdge1.weight = weight;
			directedGraph.edges.add(gefEdge1);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
