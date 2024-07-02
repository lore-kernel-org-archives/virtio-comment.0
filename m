Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B6F1CF8F
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719952679; cv=none; b=oDrwnRa3xatQ19HarmVjn/v0vfzzC01AMJqvs0DFFgFkeBJCaHfqauQ+hzC5+cdGMQ05O741C1q+QsH4KoBUgrwBaQ9ikileRliceNhTb5NPr2k4pwIVDIl9jw8uRF5mWWdPW8cwC2OrGACTgS4w3d9J0VWHUyLvMhByEoeC7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719952679; c=relaxed/simple;
	bh=8SJgO5dgtprOvKDim5RThHUyCnM1xnWwKZx2YLrlgV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUQX7v08el71wdAvf0A0q5WJ4c9vbZz1n57qKJC0arPfklXOv0lGGsMVqNvxC/5wizWsI4PmogH6p4AZf6tWqgEMaAxB+6XNkCHpzyTNJmQaXvOzs+LlvqdMpXrah4ffB7sMjsnbw2FlebDYtPsqOY/OhyKoorPTU25Hh0Z9PMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dacGFf0S; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dacGFf0S"
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462KDuOU020586;
	Tue, 2 Jul 2024 20:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	km1OV/kBLWk3s/MS/DlHUEjJJqCuJoiS88egvdFYriY=; b=dacGFf0Sajp3Rkjf
	0euIfMVoILgV7g9fTN3uuRPD/aGHSx2BQzL0Nbf6z1aN8TZpYxOVueKZUEdotA/R
	h27HPxAYXORb3hT5d7CfraVJxXZ/EFM2kdY57cLR/x5985vmu3LzNxlMK27uHs4h
	lHxoYI5XfZ6tX0LcvgLWnHUoO12fksUD/WQDXQ4eFgccHGDB028yMVC55xesW6Hf
	tnF7oDaBLqzEvDZBUOz9T6JQW5IYHJqDCMD9h+hZOz0ACaz/xBxj1DnN3a+gQcP0
	ED6LHtOnLpm86KYT9ABf7oBYZtDqAMMWv1M9MWSj3bEnZ3SWtAcsxUd/paD4tkTN
	9JZJiA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404rda01p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 20:37:55 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 462Kbsgq022290;
	Tue, 2 Jul 2024 20:37:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404rda01p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 20:37:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 462Hak8N026393;
	Tue, 2 Jul 2024 20:37:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkpxv36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 20:37:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 462Kbn9k34538130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2024 20:37:51 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D4B720043;
	Tue,  2 Jul 2024 20:37:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B4A20040;
	Tue,  2 Jul 2024 20:37:48 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.49.148])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  2 Jul 2024 20:37:48 +0000 (GMT)
Date: Tue, 2 Jul 2024 22:37:35 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>,
        Parav Pandit <parav@nvidia.com>, Heng Qi
 <hengqi@linux.alibaba.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240702223735.4fd2847a.pasic@linux.ibm.com>
In-Reply-To: <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
 <20240627181635-mutt-send-email-mst@kernel.org>
 <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iDQLFkdayGoBraRZghX-lD4Ro6gHsDfZ
X-Proofpoint-ORIG-GUID: FT4fFdq8QrhC-lBP9dO1WvxLE8h1HQAC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_15,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020150

On Fri, 28 Jun 2024 16:23:17 +0800
Jason Wang <jasowang@redhat.com> wrote:

> > Hmmm, this next sentence you reference above was indeed for the
> > interaction between coalescing and used buffer suppression. Then what's
> > the best-effort part was about, really? Round-up or round down the set
> > value to the power of 2 to save space? How is it relevant to our
> > discussion? I think even with rounding it shouldn't be too off? (as
> > said, by best-effort v.s. give up)  
> 
> Would it help if we add something like below in the guidance?
>

It would IMHO greatly benefit clarity, provided we do get it right.
 
> When the device wants to send a notification it needs:
> 
> 1) check notification suppression, don't send interrupt if it is
> suppressed otherwise goto 2)
> 2) check event index, don't send interrupt if event index is not
> crossed otherwise goto 3)
> 3) check coalescing, don't send interrupt if the coalescing limit is
> not exceed, otherwise send the interrupt
> 
> (Just to demonstrate the idea, needs tweaking for sure)

Yes I agree this indeed needs tweaking. Let me make some points.

1) for virtio-net we have 3 distinct mechanisms that police used
buffer notification avoidance, but 2 of the three are actually
mutually exclusive if I understand it correctly. Namely we have
coalescing guarded by VIRTIO_NET_F_NOTF_COAL and then depending on
whether _F_EVENT_IDX was negotiated or not, we have "event_idx based" or
"crude flag based" notification suppression.

2) Let me just quote the entire section on the good old used buffer
notification suppression
"""
2.7.7.2 Device Requirements: Used Buffer Notification Suppression

If the VIRTIO_F_EVENT_IDX feature bit is not negotiated:

    * The device MUST ignore the used_event value.
    * After the device writes a descriptor index into the used ring:
       -  If flags is 1, the device SHOULD NOT send a notification.
       -  If flags is 0, the device MUST send a notification.

Otherwise, if the VIRTIO_F_EVENT_IDX feature bit is negotiated:

    * The device MUST ignore the lower bit of flags.
    * After the device writes a descriptor index into the used ring:
       - If the idx field in the used ring (which determined where that
      descriptor index was placed) was equal to used_event, the device
      MUST send a notification.
       - Otherwise the device SHOULD NOT send a notification.

Note: For example, if used_event is 0, then a device using

VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver
after the first buffer is used (and again after the 65536th buffer,
etc).
""" 

Frankly, a MUST is a must, and I don't see very little leeway
for the coalescing to avoid any notifications. But on the other hand,
that is the very purpose of the coalescing so IMHO we have a problem
here.

The only loophole here is "after", which could be stretched to
"eventually, before the end of the world". Which would basically reduce
the MUST ad-absurdum, and I would not like that.

3) AFAIU if multiple suppression mechanisms are active
concurrently we are aiming for some sort of an logical AND semantic i.e.
a further reduction over just a single one being employed (and not OR).

But IMHO the both the wording for the event_idx based and curde
suppression, as well as for coalescing.

Let me quote the full description for the coalescing:

"""
5.1.6.5.9.1 Operation
The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in 2.7.7.

When the device has non-zero max_usecs and non-zero max_packets, it starts counting microseconds and packets upon receiving/sending a packet. The device counts packets and microseconds for each receive virtqueue and transmit virtqueue separately. In this case, the notification conditions are met when max_usecs microseconds elapse, or upon sending/receiving max_packets packets, whichever happens first. Afterwards, the device waits for the next packet and starts counting packets and microseconds again.

When the device has max_usecs = 0 or max_packets = 0, the notification conditions are met after every packet received/sent. 
"""

Here "Afterwards" is ambiguous. What we want here is "afterwards" ==
"after the notification has been sent", but one can also read it as
"after the condition has been met".

4) I see two ways to make sense out of it.

My preferred way would be to replace "send a notification" with
"generate a notification" in the main text including "2.7.7.2 Device
Requirements: Used Buffer Notification Suppression", along with adding an
explanation which states that generated notifications are sent
immediately unless a device has an active facility that under a certain
set of conditions  retains and possibly coalesces notifications. 

Please notice that here coalescence is used with its dictionary
meaning (see https://dictionary.cambridge.org/dictionary/english/coalesce), 
and that the current description of NET_F_NOTIF_COAL is more akin to a
suppression mechanism where notifications are suppressed or discarded and
not coalesced.

The notification coalescing facility would then retain the first
used buffer notification request for each queue (those are still
generated by the same rules), until either the packet count or the
timeout type max frequency (or delay we need to clarify that) condition
is met, and coalesce any further notification requests with the retained
one until it is sent.

The other way, which I'm not sure is actually viable, is basically to
try to clarify the hell out of the current approach as taken by
"5.1.6.5.9.1 Operation" by making it crystal clear when exactly are the
"notification conditions met" and what is the complement state of that,
and add a sentence to 2.7.7.2 that references device specific mechanisms
to do more suppression.  And  of course we would have to find a nice
definition for "if the notifications are not suppressed as explained in
2.7.7." such that loss of initiative is not possible.

IMHO any solution where things can stall because we would have sent
an used buffer notification without "coalescing" but we did not because
of coalescing  is not acceptable. This could happen if we cross
event_idx when the coalescing notification conditions are not met and
thus do not notify, and then when the coalescing notification condition
are finally met (e.g. via timeout) the event_id type suppression
is active again because we crossed event_idx when coalescing
notification condition was not met, and we end up not notifying again.

Sorry for the wall of text.

Regards,
Halil




