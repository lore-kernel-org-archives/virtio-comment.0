Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE047F7A
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050755; cv=none; b=VkWB35B1X3WZbNql3NQTA7MjSPyu3AG0q3Cqky1MpMLu47bOKIhM/bJh1Zb+UexD4rlUT8Fd99lo01b7hCHVeTT6cezlDIWbBjLwp3A5cqIHWk9KOKGl1Y6iyZuvc4beGAxJk/BS+McZsCG2jpz9jRqWouL4VxEC6CLZ6XdGiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050755; c=relaxed/simple;
	bh=wYxq780G8OGiSnGyIF9yM4Vm2DaBRCKp0pQwTDwDPiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw7+drcrP6Epi00QM/SsPttMRBwkjJtnGXtIq2DGVnIBp64vy5H1nybXFBl26PVl1ANUaSoEZRpCWSGVrYmjsnHXXqh3nRQiJzvTTBlMgbEyUA0GZbBlFU9apRn/ieQ9Svvo8C7xgpqAq5pNG07JgV7iXd0vmrTdsTyMacyJJOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TT3b1/Xw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TT3b1/Xw"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AJRGEX018423;
	Mon, 10 Jun 2024 20:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	sVvsb1MRBpFzWPl3Sz2Fz75WWT9BijtNdxrhUZRaHvw=; b=TT3b1/XwHS4R3IGg
	lBEWhHpDxDU2y4gIUcCcipaqlxLex6vqQDJ3Wgk6YVhN12e8C5H5WtVZwVFUUM6r
	46tALV7x4wtf2cJePK/pybBwAHZ1S6b4I6w7WyR21bb3w+dVF8HbpCl+14JXluJD
	waUoIMXQMNdUJeFiEQ9GVvvJ4AUqCFpYPnqlLLnxH6Gzr1q/Vhwggux/CfVRUTyL
	x5QOij2zJ97w+BXcUo6cUwtCfYLvVdtX8fMFqQ7hOiXzZKyrh0M0TTpKt+hzqM3C
	SfvAxzHA3PNhxeCx7QqVj5nA9kRx4Si9gxalOuTa9zRdZ0wAaW0u6RPKb5AOSCv+
	tA5qhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yp77x068y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 20:19:12 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45AKJBqJ006099;
	Mon, 10 Jun 2024 20:19:11 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yp77x068u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 20:19:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45AJb6Zf027209;
	Mon, 10 Jun 2024 20:19:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn210hx69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 20:19:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45AKJ5Zg20185544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jun 2024 20:19:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 876672005A;
	Mon, 10 Jun 2024 20:19:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFD552004B;
	Mon, 10 Jun 2024 20:19:04 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.179.12.198])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 10 Jun 2024 20:19:04 +0000 (GMT)
Date: Mon, 10 Jun 2024 22:19:00 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>,
        virtio-comment@lists.linux.dev, Jason Wang
 <jasowang@redhat.com>,
        Parav Pandit <parav@nvidia.com>,
        Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240610221900.1810ea96.pasic@linux.ibm.com>
In-Reply-To: <1718026545.7557275-2-hengqi@linux.alibaba.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
	<20240607220246.3213607c.pasic@linux.ibm.com>
	<1717814062.4461155-1-hengqi@linux.alibaba.com>
	<20240610144602.57a04723.pasic@linux.ibm.com>
	<1718026545.7557275-2-hengqi@linux.alibaba.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lBFQT1soeb_9gNZHwlQFg8RevMZ--UZ8
X-Proofpoint-GUID: xRqQAX6zVnDohHtqIQt87xA0kTeczM4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_05,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100150

On Mon, 10 Jun 2024 21:35:45 +0800
Heng Qi <hengqi@linux.alibaba.com> wrote:

> On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
[..]

> > > If the device chooses a stupid
> > > maximum value, it is his choice (spec should give more devices choices instead of
> > > forcing them to choose "0" which is not the best practice). We can't talk about
> > > performance for drivers when the devices tend to choose any "stupid" designs.
> > > 
> > > We need relaxe the restrictions and makes the spec more reasonable.
> > >   
> > 
> > Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
> > those correctly the driver -- contrary to my initial expectation --
> > negotiates the feature, but does not set the parameters explicitly and  
> 
> How does the driver know what parameters to set? 

Disclaimer: I'm not very knowledgeable when it comes to networking and
NICs. Please be patient with me.

If I understood that properly have previously stated that it is basically
a trade-off between "latency friendly"  (downside: overhead and not so
throughput friendly) and "throughput friendly" (downside: not so latency
friendly). And that makes sense to me.

So I would think, the answer to the question what is the best trade-off
should also depend on the workload.

Now as far as I understand although we call the parameters max_usecs and 
max_packets the notification condition is dictated by those two values. I.e.
there won't be a notification unless the compound condition is met.

When there is no traffic 0 and 0 looks like reasonable values to me: I
want the first of possibly many packets ASAP. Depending on the actual
load, maybe one could employ some sort of a heuristics to keep good
balance -- maybe based on a frequency of interrupts. Maybe DIM is
actually exactly what I have in mind.

You seem more knowledgeable on the topic. How is this usually done? How
are the optimal values correlated with device characteristics?

> The parameters should be
> exposed by each device.

I would like to better understand why. My intention is not to question
the correctness of this statement, but to gain a better understanding.

> 
> > thus keeps the defaults (until userspace decides to set the parameters).
> > So it does matter whether the defaults are guaranteed to be 0 or not,
> > and if not it does matter what defaults are chosen by the device.  
> 
> Didn't follow this. More below.
>

Maybe my statement was wrong. So let me make a question out of it. What
entity or entities do we expect to change the parameter values, and when
or under which conditions do we expect them to change the parameter
values?
 
> > 
> > One could even argue that those patches have been reviewed under the
> > assumption that the device needs to use 0 as the default parameter value.  
> 
> The default value should not be explicitly specified in the spec, because one
> size does not fit multiple devices.

This ties in to my previous question about the relationship between
device characteristics and the optimal values for max_usecs and
max_packets.

> The source of this problem is that we are
> missing fields like default_{rx, tx}_coalesicng_params that indicate the device
> capabilities. No?

I don't think so! In my understanding is that with your proposal
after a reset, the OS/driver has no problem obtaining the defaults that
indicate the device capabilities. But I would really like to better
understand that device capabilities part.

And yes another way around this would have been say:
* let us introduce those defaults fields, e.g. to the config space
* make the driver read those values as a part of the initialization
* and set those values as the initial parameters.
But frankly I see no benefit of that over what you propose here.

Regards,
Halil
