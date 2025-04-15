Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BDD2951A3
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727318; cv=none; b=Bwg8x5LndF6tJoBvvDVdKveFG+EJvcPjVqe70i0WlQ6ZB/AF0mi19ib9XCy+4IX9HUeaG/9+snU97YBVB5/ZWxmivW+KoT23kNpwpVb8f9drzTQO3S5jRSdCe+LrdfS8+aZfVnS4cpzQTKBI0B63flAsUWlwr482jsJNAGdu3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727318; c=relaxed/simple;
	bh=WE3YJcXh2d1EDT7DDGq5wYOsFGOem2zCrtT2nbZ5u/8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJPmcg9Avj2Cje5ncQhXvV5IaEamVIW3ExpsX2RJABePmVZy9/dhZ3C7xacjhD0Rka0lSjk3kB0P/406yfPmMZRXlqKt11sHoCGgU2lsS8/7NADy66RqaqM738/fLsLtjdY2zACgIDQFYnwLHhVntW4njUIP22FtOpTKbeOe+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hu5uYLWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hu5uYLWe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u7An002933;
	Tue, 15 Apr 2025 14:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IhFuq+EOYZnAs12ww3P7qnu3
	hQjhrtrRrVzas17rruY=; b=hu5uYLWekfaOYDJ5u4/gpydRaGNukC/ovEQbMNmc
	gESFx3ut1c78DKFus6e1V4X50tDofp6crohC3fzwPpr0EiQZtNi/7DI0lO1IPf21
	IWHjcI+uufR1PYsJfoU+G5fUwfoIyhEiYsFs+n69uLhYfYMH+b5gY5TaTmONSO4c
	c4dj5v7Ww/ZFigYzh6zqRf+I9JCNyhZp1p+fp0hgU7Pntakf3U5aGcrCE/wRTY6G
	nTGiE+VomN6oOvrgrfmnRa08rVwOfz+WGU/kcbT3cPCzEWkAs3PW49PFeTla38U/
	M3oFFYvAol3lxiFBLuyYvKS3JhKbAJojCkap8tOSG/N5Aw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk07sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 14:28:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FESXcj009767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 14:28:33 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 07:28:31 -0700
Date: Tue, 15 Apr 2025 16:28:28 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Cornelia Huck <cohuck@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>
Subject: Re: [PATCH v8 2/4] virtio-rtc: Add initial normative statements
Message-ID: <2votukfj53jbj6wkpcohz5ufvhdij6rwlqr5mlqci35kpp3aje@pevtkx7traqs>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-3-quic_philber@quicinc.com>
 <87mschsfl0.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87mschsfl0.fsf@redhat.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe6d12 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=N2OibLM8IR9tJBOMKt0A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: noT9zq0yho1499JOm6thqTUIhrw9QHHY
X-Proofpoint-ORIG-GUID: noT9zq0yho1499JOm6thqTUIhrw9QHHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=791 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150102

On Tue, Apr 15, 2025 at 03:46:03PM +0200, Cornelia Huck wrote:
> On Thu, Mar 06 2025, Peter Hilber <quic_philber@quicinc.com> wrote:
> 
> > Add the normative statements for the initial device specification.
> >
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> 
> (...)
> 
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index 5d8cf91a6991..f2a3907de511 100644
> > --- a/device-types/rtc/description.tex
> > +++ b/device-types/rtc/description.tex
> > @@ -73,7 +73,7 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
> >  VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
> >  specific request due to an implementation limitation. The device also
> >  returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
> > -in the fields \field{msg_type} or \field{hw_counter}.
> > +in the \field{msg_type} or \field{hw_counter} fields.
> 
> Looks like some hunks with wording changes ended up in the wrong patch?
> (A couple more of those in the remainder of this patch.)
> 

Yes, terribly sorry about this oversight... I will provide a fix.

Thanks,

Peter
