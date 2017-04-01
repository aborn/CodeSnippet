
public static void main(String[] args){
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //return "redirect:/index.html?c=scene&key=hot";
    for (Map.Entry<String, EleDataAtom> entry : eleDataAtomMap.entrySet()) {
    }
    String[] strings = os.trim().split("\\s+");

    Calendar cal = Calendar.getInstance();
    // Specific Day 2017.3.16 00:00:00
    cal.set(2017, Calendar.MARCH, 16, 0, 0, 0);
    Date date = cal.getTime();

    // url decode using java
    String result = java.net.URLDecoder.decode(url, "UTF-8");// java ArrayList swap elements
    Collections.swap(List<?> list, int i, int j);

    try {
        //方法一:采用IOUtils
        InputStream inputStream = request.getInputStream();
        String rs = IOUtils.toString(inputStream);

        // 方法二:分段读
        final int bufferSize = 1024;
        final char[] buffer = new char[bufferSize];
        final StringBuilder out = new StringBuilder();
        Reader in = new InputStreamReader(inputStream, "UTF-8");
        for (; ; ) {
            int rsz = in.read(buffer, 0, buffer.length);
            if (rsz < 0)
                break;
            out.append(buffer, 0, rsz);
        }

        JSONArray jsonArray = JSONArray.parseArray(out.toString());
    } catch (IOException e) {
        APISysLog.warn("", e);
    }
}
