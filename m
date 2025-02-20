Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01008221DB7
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071212; cv=none; b=rZ5ikijOZNxVgFT+6y5v59WG1Wz+vdf3R/wcxbVTbJLuclQ0cIll+Zj9YSIoeg3MESkIH4k6XPu/x6ZpCGrmwPRnmSkaF5aKbWm0A1saEN36NM/HHj5K/96AP529EPeYyzLk5kS6fb9/kUZUt3jBbp268d0aGKHUgUJ7Q1mTkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071212; c=relaxed/simple;
	bh=dxzOBfTwYBqQjiAmDT8PC3rUiHlY+ssyoG2fzggn8ww=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS6XIVuWHNbzgLAYHmYLNEf3+4FEhp03S/TQai7mIZwi8aO8+0PXYoZDkkKsC8QpWLywaYekfnauF5SQu62p+aUjXHBxVDAkIM3WGYP/m49tq74mjo5OEoEj7F6E1FkkLLWl+At6skM3mb8BcH2i4EXF2CSwdOKC9t4/IxS/js4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g4jv2ZGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g4jv2ZGh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KH0wNk020486;
	Thu, 20 Feb 2025 17:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYJraXzeCgvcXX24Cx4XO/Cp
	w1KktRWfKBG8muZcHqk=; b=g4jv2ZGhGt12bOio+3aIKw8EbdZ35MUpSoKSo/Ly
	gdAVSUmNCCrLKU05vF46nQJTmupI2TAd6Q3zKf3SpG7Vh+2XQFRfvOI5ahxyMjO2
	+8onwKx1LHXj91cU03g+FPmZdQpfwzh4DE+ujRANsOz1tGh9pxWs20DbqhmFU4rn
	4ASGy1YEX53xLef5p6Mnmrxv3XSPxrr0CeS294H9fZTGPzTbe4E7SmmdUBqLRptb
	a5IDeO7zUjaIwJ74JILFDqTcoUWzAk/pN6yObt9ESaybq/uDAeVx+WboJTCHgiH6
	2/thslWxwkKyldUM6hagMh1AlW4u7VstrHY0cVWjhA6gtA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t1ha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:06:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KH6iw3024940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:06:44 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 09:06:42 -0800
Date: Thu, 20 Feb 2025 18:06:38 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
 <Z7X6bpwsqRymDHZu@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7X6bpwsqRymDHZu@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Y8JvYfgPckKUUTfCe4pjT2H2HdN4SAzp
X-Proofpoint-GUID: Y8JvYfgPckKUUTfCe4pjT2H2HdN4SAzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=895 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200120

On Wed, Feb 19, 2025 at 04:36:14PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> > On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > > Add the normative statements for the alarm feature added previously.
> > > > 
> > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > ---
> > > > 
> > > > Notes:
> > > >     v7:
> > > >     
> > > >     - Remove inadvertent v6 changes, which should have been part of
> > > >       preceding patches.
> > > >     
> > > >     v4:
> > > >     
> > > >     - Update normative statements to match v4 changes to non-normative
> > > >       statements (patch 3).
> > > >     
> > > >     - Driver should read clock to confirm that alarm has expired.
> > > >     
> > > >     - Formatting and wording improvements.
> > > > 
> > > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > > >  device-types/rtc/device-conformance.tex |   4 +
> > > >  device-types/rtc/driver-conformance.tex |   2 +
> > > >  3 files changed, 163 insertions(+)
> > > > 

[...]

> > > > +
> > > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > > +stop serving any previous alarm expiration event for C, within a grace
> > > > +period.
> > > > +
> > > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > > +serving any previous alarm expiration event for C, within a grace
> > > > +period.
> > > > +
> > > > +If the device is currently serving an alarm expiration event E, the
> > > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > > +soon as an alarmq buffer is available for this purpose.
> > > > +
> > > > +While the device is serving an alarm expiration event, the device MAY
> > > > +execute implementation-specific alarm actions.
> > > > +
> > > > +The device MAY ignore the device status when executing
> > > > +implementation-specific alarm actions.
> > > > +
> > > > +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> > > > +executing implementation-specific alarm actions.
> > 
> 
> I wonder if these last three requirements are needed or we can just drop
> them.
> 
> Matias
> 

The intent of these requirements is to clarify that this is legitimate
and expected behavior of the device. I can drop them if this is
considered unnecessary as normative requirements. Or maybe one
requirement would be enough:

	While the device is not serving an alarm expiration event, the
	device MUST NOT execute implementation-specific alarm actions.

Thanks for the reply,

Peter
