Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839C2528EE
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902502; cv=none; b=GWUoM+0wy/g6upsrw83QZ9OtbMxP8A8rQNlTODd1EdeJdQ0zGnJ9748XWgypZeebhCsO4BDf24qV7iEax1TYcfLin5V0xUSYDNNgCsy33xxLceUhCPHjDbO2ZYFz88l7JM5O4x6O3bDN+VVDoS/npIhPYRxU0DZizfyy6h9TM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902502; c=relaxed/simple;
	bh=90RqnRvupwU0BR9SGKUWzVfalJPGdvuSfC02UqZ9EwI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5/cNBzJtdCRBkh7CuQPz5+z/ys5F+P1ukfp4ZT0H1IW/OiWSoT5ydj4ipXOqen7D3NWR7pJ1BBgcADMcD7iaDkrGOgrRDXh7EwoZJmyoLjcgrbNqJ4u1Fr2K7L0vWMch0y8qrvfc7jScOGNN9tanImKGtXVHEu/POECvFVJ7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gV+u9x65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gV+u9x65"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClSxd029071;
	Thu, 17 Apr 2025 15:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6bCDYABtYa6FiGikP9coidqJ
	KWyw8wZdMZzY4dOZCq4=; b=gV+u9x65vhEW6kdD7lV7GKAdXKmbw3vFoSGVL/fd
	swpElCIztVA7VvP4p6Myg+pKxfTEmXuI8PyQvAdG0rMFv7e+EkRsXUVCimw7gWFz
	/LA8XHRbUTHXx7a7HH3zAhTkgMCOT9HNpRIkrqwrxjI0yKP/nRjCTyDCJuCEnBzD
	WGThPZBXevcPt3La+FBT+cE4o4Xo85zx1uWbB6YlgdB8vP50QzVElNcQPBSlOU6o
	9wtntyxO4oWxw4iZqKDPxqxUTO+fI6OU/hsp0rmlunDQP6Exc0aC+SR8BwoZ8aNa
	gAJ0Ic5lArsIQjpvYJBaQs7CuN70KR8m78j23UdR+iMH+g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9fb3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:08:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HF8EFQ018425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:08:14 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 08:08:12 -0700
Date: Thu, 17 Apr 2025 17:08:09 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
Message-ID: <5nlkfsdz2dplnnzuncgbemsuwk5m7hdeddwsluydcma635m6wn@4kwbsdvpayif>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250416114208-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416114208-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dk0vbErBANyfO4vHhldSZQ_vi78sfY_c
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6801195f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=07gzBp3RG5I_iY9ZXWcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: dk0vbErBANyfO4vHhldSZQ_vi78sfY_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=746
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170113

On Wed, Apr 16, 2025 at 11:43:25AM -0400, Michael S. Tsirkin wrote:
> 
> 
> Good work. I sent some comments but they are pretty minor. Thanks!
> 
> On Thu, Mar 06, 2025 at 10:51:08AM +0100, Peter Hilber wrote:
> > This iteration of the spec should address multiple review findings from
> > Matias Ezequiel Vara Larsen.
> > 
> > Summary
> > -------
> > 
> > The RTC (Real Time Clock) device provides information about current
> > time. The device can provide different clocks, for the UTC or TAI time
> > standards, or for physical time elapsed since some past epoch. For UTC
> > clocks, the device can also indicate how leap seconds are handled. The
> > driver can read the clocks with simple or more accurate methods.
> > Optionally, the driver can set an alarm.
> 
> A bit more text on the motivation, when to do you intend to use this
> device, would be good.

I will add this.

Thanks for the comments!

Peter
