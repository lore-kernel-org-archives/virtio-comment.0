Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339727701
	for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498451; cv=none; b=YvynSyrQaFnR4LEY/b18JszncW2pG4sEUR69xdFAcXnEVPkbN7Psmd6cXNpZJXLzMktmGRt+cW0rsqpDP0Rz21ZXEr7O91PYF3kqMhF+1e339TwJnm23ucJexe/XE0SLGfgHl4NYsdi9hwQfyJ7fjW86XkOhMCDGfzlgWKhyEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498451; c=relaxed/simple;
	bh=BSLyy1wUzSqythxpLLzgmmXpebACOIsIJzptMZWyuok=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoQYPBUV99SA9ZAzFXZu/yxlL7MBvum2LunJRaeKp5Qfg0W2rHPe0Qw7HzSZyIl70KtygWFTw08n+zSLRHSchvvjezQxwarQpWwnqm69o0bIXeFSS9GO7dBUW0payH/dq9GRr6kKvryz3OYE9FZ3NRqKHbRJKavewSFIXR8dlf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NNMLXoZ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NNMLXoZ2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8LPRR014155;
	Tue, 25 Feb 2025 15:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pxZmn9bleZ6jvtFW5U6+65fb
	1IeXr2XwCIKhkp6Rg7E=; b=NNMLXoZ23jSrw47RVFC0h2hVBhgD4qwU3bItP4oD
	rgxiNWbbJ0PpymOSodNWXjnu/2zXhaekVy4Fw1fYOUR6SYP/dkK/hAQ08D40FajV
	kvZXJJjSsd8x0QGY+djfQ+eChWy2DeN0b1iLQcQjn5Xd16ZaJ1jmBh81lhmWm07a
	9zVflK1p483izstWRRSiD0fRbmNZLp+sfc4Q4dIXjFcgeDPOY8ZJ6MNt+78Ym7TD
	nCh/fvxlFzuNo23yNTXlF/ZQQFZuC04tnGR5TREYmH8yGgBIZgs26Emhgah7xLoo
	N3vkb/Z0TCvBlfEVWkTco+X+ePZiXRmp9zrtoNa8piOZZA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgse8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 15:47:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PFlO2e008851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 15:47:24 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 07:47:21 -0800
Date: Tue, 25 Feb 2025 16:47:18 +0100
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
Message-ID: <lqc23ngapzickem47d64qc6wlowpcqo6eblw4ox66r5fa2inrr@yubwapgbyrzn>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
 <Z7X6bpwsqRymDHZu@fedora>
 <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
 <Z7xieowGXaZ3kqBc@fedora>
 <4wre24mz2dkf3xlokwrhrtyekgaprezwhkubsqts6ywicz74kh@5imrnci63tuc>
 <Z73cDJ8i2jDHiU09@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z73cDJ8i2jDHiU09@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: btbh7wOefB_Md7g8voNzUNB5mMROUGPG
X-Proofpoint-ORIG-GUID: btbh7wOefB_Md7g8voNzUNB5mMROUGPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250103

On Tue, Feb 25, 2025 at 04:04:44PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Tue, Feb 25, 2025 at 12:18:51PM +0100, Peter Hilber wrote:
> > On Mon, Feb 24, 2025 at 01:13:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > On Thu, Feb 20, 2025 at 06:06:38PM +0100, Peter Hilber wrote:
> > > > On Wed, Feb 19, 2025 at 04:36:14PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > > On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> > > > > > On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > > > > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > > > > > > Add the normative statements for the alarm feature added previously.
> > > > > > > > 
> > > > > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > > Notes:
> > > > > > > >     v7:
> > > > > > > >     
> > > > > > > >     - Remove inadvertent v6 changes, which should have been part of
> > > > > > > >       preceding patches.
> > > > > > > >     
> > > > > > > >     v4:
> > > > > > > >     
> > > > > > > >     - Update normative statements to match v4 changes to non-normative
> > > > > > > >       statements (patch 3).
> > > > > > > >     
> > > > > > > >     - Driver should read clock to confirm that alarm has expired.
> > > > > > > >     
> > > > > > > >     - Formatting and wording improvements.
> > > > > > > > 
> > > > > > > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > > > > > > >  device-types/rtc/device-conformance.tex |   4 +
> > > > > > > >  device-types/rtc/driver-conformance.tex |   2 +
> > > > > > > >  3 files changed, 163 insertions(+)
> > > > > > > > 
> > > > 
> > > > [...]
> > > > 
> > > > > > > > +
> > > > > > > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > > > > > > +stop serving any previous alarm expiration event for C, within a grace
> > > > > > > > +period.
> > > > > > > > +
> > > > > > > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > > > > > > +serving any previous alarm expiration event for C, within a grace
> > > > > > > > +period.
> > > > > > > > +
> > > > > > > > +If the device is currently serving an alarm expiration event E, the
> > > > > > > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > > > > > > +soon as an alarmq buffer is available for this purpose.
> > > > > > > > +
> > > > > > > > +While the device is serving an alarm expiration event, the device MAY
> > > > > > > > +execute implementation-specific alarm actions.
> > > > > > > > +
> > > 
> > > Does not `serving` mean also that the device execute
> > > implementation-specific alarm actions?
> > 
> > As for `serving an alarm expiration event`, I intended this to be a
> > speaking name for a state to which different requirements can refer.
> > Maybe this was bad naming.
> > 
> 
> I just though that `serving an alarm expiration event` could include
> executing implementation-specific alarm actions so that we do not need
> to make a separation of the two concepts. I do not have a strong opinion
> so we can keep it as it is. 
> 
> > > Besides notifying the guest when
> > > an alarm has expired, is not any other action or device behavior
> > > implementation-specific and then not constrained by the spec?
> > 
> > So this would imply that the below MUST NOT requirement should not be
> > adopted? I chose to refer to implementation-specific alarm actions so
> > that 
> > 
> > 1) it is clear to any spec reader that alarms may work even when an
> >    alarmq notification would not work and
> > 
> > 2) an implementation's documentation can usually refer to the spec as to
> >    when the implementation-specific alarm actions may be executed.
> > 
> > I find the references helpful, but I do not have a strong opinion about
> > keeping them in the normative or non-normative parts.
> > 
> 
> I do not have a strong opinion either so we can keep it as it is.
> 
> Thanks, Matias.
> 

If I kept track correctly, tentative resolutions for all review findings
so far in the 4 patches have been discussed. I will try to send a
corrected version this or next week.

Thanks for the reviews,

Peter
