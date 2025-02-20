Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE561213E8C
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070296; cv=none; b=m8o1h+pMYkZ/7p9ZOOU9WxOLoXGGs1A9n9bTB6OcwPc5OLBWJHaN3NU+AahpoNQ5cw78ki3gartwv6DGr/fJuhvDGGNzgdbBmrdwcL0rj3QSK/58QSfI4NawVL0JeE8HBO599nytUdejpnXWQ98xqA131hHIy9zh6JOmK2TnvzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070296; c=relaxed/simple;
	bh=bkJmrEBp9nKAn4GviI4MDFPU++gCfReyVAw0NkdXjVg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAo1lrkEkKEWNP/k4KaAW6nHoRC343tsyLbFyCW39ivedC7JSs06LLxbCO/njWCGoACtwDokwB/+iD8V0oMCMEo7PMji4uYkxBk1yI5lq5/ydj1eHiqUqnYgJqGz3J76Gcbu+dMsA6836tnMQbkGQpdHbgs1klKoiaSNiJZA73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZJnLT5mf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZJnLT5mf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KG9hPO014987;
	Thu, 20 Feb 2025 16:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VkQoDbJYjWN4NOiNFNY94syB
	3Ffec+gvnAqkSO2vyVM=; b=ZJnLT5mfTAkFPOlYMIzfRusR7ab0XSoh10bbErNM
	yvAY2DbGoTDAhK4HcTP11voojfwkfQGYHpOBP/1FwXia4aHmX8vPdjEbsOSoHZeh
	llVnxdqsZKeAXAWymNavu9fTJkeW1zWIQzPlYvezBKWNLvIDux6BWn9S5+OU+cjW
	6SO/AiwYrKN8xEnz6fkBNCvZ9u165f2dwT2ZJ4KY5BA2iVJOUOLEKJ4MxeymE5wV
	FB5TgymL28pHRm4niLZnuR8FP9nFPqKAtb+7s7Hz/S4BW5dFic8NXbWIt/tKYXnA
	GK3pNweLarkSo2UDJkx/t/admMPhOg5euM3kZ0lqAknWyQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy16rdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 16:51:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KGpTqm018112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 16:51:29 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 08:51:26 -0800
Date: Thu, 20 Feb 2025 17:51:23 +0100
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
Subject: Re: [PATCH v7 3/4] virtio-rtc: Add alarm feature
Message-ID: <xu4mpst6krjpeqw2cf5cogdztrpmritjk2phi3jb7ohjilkugs@cx4ymgr2ztny>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-4-quic_philber@quicinc.com>
 <Z6s52sYSmuhp8M4/@fedora>
 <3gos5s6jqul2o5bn26t5ie5b44ernrbk7r262kns5gnma5mvpe@ej3aicxv2jav>
 <Z7YCA1BWmGb+eqwH@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7YCA1BWmGb+eqwH@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aXIqvtwROtLQMr9Gm_QnJQ6BkO_-kTtL
X-Proofpoint-ORIG-GUID: aXIqvtwROtLQMr9Gm_QnJQ6BkO_-kTtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200118

On Wed, Feb 19, 2025 at 05:08:35PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 13, 2025 at 07:13:47PM +0100, Peter Hilber wrote:
> > On Tue, Feb 11, 2025 at 12:51:54PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > On Thu, Jan 23, 2025 at 11:16:14AM +0100, Peter Hilber wrote:
> > > > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> > > > 
> > > > The intended use case is: A driver needs to react when an alarm time has
> > > > been reached, but at alarm time, the driver may be in a sleep state or
> > > > powered off. The alarm feature can resume and notify the driver in this
> > > > case. Alarms may be retained across device resets (including reset on
> > > > boot).
> > > > 
> > > > Peculiarities
> > > > -------------
> > > > 
> > > > Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> > > > autonomously at any time: An alarm may change back from "expired" to
> > > > "not expired" before the driver has started processing an alarm
> > > > notification.
> > > > 
> > > > To address the above, and the device resets, define "alarm expiration"
> > > > in such a way that the driver always has a chance to react to an alarm,
> > > > and make the device always responsible for notifying the driver about an
> > > > alarm expiration.
> > > > 
> > > > The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> > > > ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> > > > 
> > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > ---
> > > > 
> > > > Notes:
> > > >     v7:
> > > >     
> > > >     - Change flag numeric value due to removing leap second indication.
> > > >     
> > > >     v5:
> > > >     
> > > >     - Reformat.
> > > >     
> > > >     v4:
> > > >     
> > > >     - Change requirements so that driver can reset alarm to clean slate, and
> > > >       document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
> > > >     
> > > >     - Require device to support all expressible alarm times.
> > > >     
> > > >     - Formatting and wording improvements.
> > > >     
> > > >     [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/
> > > > 

[...]

> > > > +An alarm expiration becomes obsolete
> > > > +
> > > > +\begin{itemize}
> > > > +\item once the clock jumps backwards, before the alarm time, or
> > > > +
> > > > +\item once the driver sets an alarm time, or
> > > > +
> > > > +\item once another alarm expiration event happens.
> > > > +\end{itemize}
> > > > +
> > > 
> > > This is a minor comment, I think you can use `when` instead of `once` like
> > > in the paragraph before.
> > > 
> > 
> > OK.
> > 
> > > > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > > > +actions the device executes for this alarm expiration, and the device
> > > > +stops executing these alarm actions after a grace period.
> > > 
> > > What is a grace period? You mean that whatever the device does after
> > > alarm expiration, the device has to STOP doing it after a grace period.
> > > Am I right?
> > > 
> > 
> > "[An] alarm expiration becomes obsolete" means that the device should no
> > longer act according to the alarm (typically because the driver disabled
> > the alarm, or for one of the other reasons listed in the above
> > enumeration). In this case, the device must stop the alarm actions as
> > soon as possible (within a finite grace period). 
> > 
> > Maybe I could rephrase like this?
> > 
> > 	If an alarm expiration becomes obsolete as per the above
> > 	conditions, it is unspecified which alarm actions the device
> > 	executes for this alarm expiration, and the device stops
> > 	executing these alarm actions as soon as possible.
> > 
> 
> I wonder if we can just drop this and let the device implementation do
> decide when an alarm is obsolete and what to do in that situation.
> 

Are you referring to an obsolete alarm expiration, or to an obsolete
alarm? (As for the alarm, I would say the device should only consider an
alarm totally obsolete once the driver disables the alarm, acknowledging
it.)

As for the alarm expiration obsoletion text above and the related
requirements in patch 4, I think they are still required for the
following:

1. The requirement to obsolete alarm expirations when the driver sets a
   new alarm makes it possible to prevent information leakage, as
   discussed in [2], per the procedure listed elsewhere in this patch:

	+Alarms set prior to reset may cause unwanted alarm expiration
	+notifications, and information leakage, after the reset. To prevent both
	+issues, the driver can do the following after the reset, for each clock
	+which supports alarm:
	+
	+\begin{enumerate}
	+\item Send a VIRTIO_RTC_REQ_SET_ALARM message, with \field{alarm_time}
	+        set to 0, and \field{flags} set to 0.
	+
	+\item Wait until the device marks the VIRTIO_RTC_REQ_SET_ALARM message
	+        as used, with status VIRTIO_RTC_S_OK.
	+\end{enumerate}
	+
	+To prevent the above issues, the driver also marks buffers in the alarmq
	+as available only after completing the above steps for all clocks.

2. Without the requirements to obsolete alarm expirations, it might not
   be clear how long the device needs to remember to send a notification
   through the alarmq, in case there is no buffer available in the
   alarmq.

> > > > +
> > > > +The driver-visible settings of an alarm consist of two elements:
> > > > +
> > > > +\begin{itemize}
> > > > +\item \field{driver_alarm_time}, a valid time for the corresponding
> > > > +        clock, and
> > > > +
> > > > +\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
> > > > +        true, \field{driver_alarm_time} is the actual alarm time.
> > > > +        While \field{alarm_enabled} is false, the device will act as if
> > > > +        the alarm time was in the future, so that the alarm will not
> > > > +        expire.
> > > > +\end{itemize}
> > > 
> > > Is `alarm_enabled` a field that is device implementation specific?
> > > 
> > 
> > No. The use of "\field{}" around alarm_enabled is for typographic
> > purposes, not because it is supposed to correspond to a particular
> > element in the device implementation. It is unspecified how the device
> > implements the alarm feature.
> > 
> > The two elements mentioned above describe the state of the alarm in the
> > device which the driver can set and get through the respective requests.
> > 
> > By overriding driver_alarm_time with an alarm time in an unreachable
> > future if alarm_enabled is false, the spec does not need to consider the
> > alarm_enabled state in most places. Most non-normative text and most
> > requirements just need to refer to "alarm time reached", not to "alarm
> > time reached and alarm enabled".
> 
> I see, are you suggesting to replace driver_alarm_time and alarm_enabled
> occurrences?  
> 
> Matias
> 

In this version, the occurrences have already been replaced in most
cases, so to speak. alarm_enabled is only introduced towards the bottom
of the "Alarm Operation" section. Most of the spec ignores
alarm_enabled, since alarm_enabled == false has the same effect as alarm
time == unreachable future. But since conflating alarm time and
alarm_enabled creates confusion, I now think alarm_enabled should just
be mentioned across all non-normative and normative sections instead.

(This version specifies that the driver sets driver_alarm_time and
alarm_enabled. The spec synthesizes the applicable "alarm time" from
both, for the purposes of specification: 

	While alarm_enabled is true, driver_alarm_time is the actual
	alarm time. While alarm_enabled is false, the device will act as
	if the alarm time was in the future, so that the alarm will not
	expire.

This version does not require the device implementation to actually
synthesize the "alarm time".)

But, as said, now I think I should just refer to alarm_enabled
everywhere, and drop the driver_alarm_time and "alarm time" distinction.

Thanks for the reply,

Peter

[2] https://lore.kernel.org/all/20231218064253.9734-1-peter.hilber@opensynergy.com/T/#m7215c69a093618086138ad3817b740b19b98bd3a
