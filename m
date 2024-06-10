Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4180C02
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023573; cv=none; b=emkn9hwr9BwIYvo6x3xPBkdEe7eLY5PG9z+vUT9+QdrgBTSYW6Iydcwp4fFRRNHQI85i5b8tP8+CsDjNxEOT4kHch+j8EpXTSZNoY1wg+GZM0KLNJuubGwkVkNw2i+c2zOT57fYbRT4SL+QfmGd2oN/z1lv83fnrfl2Xv4W2/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023573; c=relaxed/simple;
	bh=Kiz18jxraS9GfLt74yjIA0/o9XrDeYqXT5hUjIeGKVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJJXAocy6tpX8gPyWCEe261qqRfemumnOB4rbDjOWPQ5Meu7Okys+KvkCUY/f2oW8qtAnb60IFjT6v46cpmbPBjZRX+/RupB5QdeNj0jB7ej3JSEWMuTbJkERdTaxmuNtXYkRqxj+bEmQrteGOdrgimTUbq4e3U8wJ5GL0G8R0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=td2u9Dp4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="td2u9Dp4"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ABSKW9005729;
	Mon, 10 Jun 2024 12:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	AMqD9aZpLr4HeCI8NG1JSvWdB51TA34GU5fcDy19E+c=; b=td2u9Dp4B+agCFNC
	7MKAGYEVKBRairw38V4tgw3pEtssqYZmvva54kxKUp9YTyaqs4Wr0zowY8Nkw0gs
	5pVkswsj1MvMPAJh4KUuuv+iIOAyv9z1OdSNdqV1mTLmdedof05N4248TgNXCp7z
	5TOIzR/M+L9xiCGwzZLJIpuJFnsr2/dGdlfx2rJKv0cdYEb7v3dD4SbU4hPvjgkk
	3sOcMWflk0aGSDUTfsxcbc+N9a3iWysSd0oceFPkw/kNjxGNAGSnT/gesvUFPumi
	65sALAerxqOsbG6M8ZK/DoGMUE967VUtem+r2CukmjIXbxERAfcbkr6a/aGXbrWP
	0zOBFQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yp0n0877j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:46:09 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45ACjv8S002913;
	Mon, 10 Jun 2024 12:46:09 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yp0n0877g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:46:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45A9P8wK028680;
	Mon, 10 Jun 2024 12:46:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn1mtyshn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:46:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45ACk4H657147812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jun 2024 12:46:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82FC82004D;
	Mon, 10 Jun 2024 12:46:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 083CB20043;
	Mon, 10 Jun 2024 12:46:04 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.179.12.198])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 10 Jun 2024 12:46:03 +0000 (GMT)
Date: Mon, 10 Jun 2024 14:46:02 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240610144602.57a04723.pasic@linux.ibm.com>
In-Reply-To: <1717814062.4461155-1-hengqi@linux.alibaba.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
	<20240607220246.3213607c.pasic@linux.ibm.com>
	<1717814062.4461155-1-hengqi@linux.alibaba.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kQ6qY1fdtxZlDGzcMXbVF2NNf9qZgJ8S
X-Proofpoint-ORIG-GUID: AXN_9-tg37niITkjjlkNe5wWHAFsWZBM
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
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100094

On Sat, 8 Jun 2024 10:34:22 +0800
Heng Qi <hengqi@linux.alibaba.com> wrote:

> On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > On Tue, 28 May 2024 12:47:02 +0800
> > Heng Qi <hengqi@linux.alibaba.com> wrote:
> >   
> > > The device can set any initial coalescing parameters (0 or non-zero)
> > > for the receive/send queue before the setting command is executed,
> > > not just 0, enhancing device performance even without DIM enabled.
> > > 
> > > So we need to clarify descriptions that don't fit the behavior.  
> > 
> > Sorry I'm late to the party -- again! Just for my understanding: how/why
> > is this a clarification and not just a (basically incompatible) change?  
> 
> In my opinion, "clarification" means that something may have been described
> incorrectly before, and we now need to discuss, explain clearly, and correct
> the possibly incorrect description.
> 

I figure the difference in perceived semantics of the word
"clarification" is at the root of my confusion. Let us have a look at
https://dictionary.cambridge.org/de/worterbuch/englisch/clarification

According to my understanding a "clarification", while an improvement in
ease of understanding and/or decrease of ambiguity (possibly to no
ambiguity at all) implies that what receiving a clarification is not
outright wrong.

When rectifying something that is outright incorrect or wrong, I would
refer to that with words like "correction", "fix", "erratum" or
"corrigendum".

> > 
> > I mean if I read this correctly, before the driver had the guaranty
> > that if the parameters are not set by the driver, negotiating the
> > feature does not introduce any coalescing. After this in theory
> > the device could just pick some max value and potentially introduce
> > maximal latency in certain scenarios.  
> 
> "maximum latency" also means "throughput improvement".
> 

Under certain assumptions. But not necessarily. Again my concern is
mostly the type of change. The virtio standard maintain a revision
history appendix, and I would like to avoid the nature of this change
being misrepresented there. If Connie and/or Michael think it is worth
fixing, I believe it can be fixed with an editorial change.

AFAIU VIRTIO_NET_F_NOTF_COAL and VIRTIO_NET_F_VQ_NOTF_COAL are about to
land with virtio-1.3, i.e. there is no released/standardized virtio
version where the "initialize to 0" is released. In that sense it looks
like we are still on time to change this. But I am not 100% certain. In
any case I don't think this as a huge impact and I'm fine going ahead
with the change.

> > 
> > I understand that it is probably in the best interest of the devices to
> > not pick stupid defaults. But it is also probably in the best interest
> > of the driver to set those params, and if the driver is going to set its
> > values, the devices defaults are moot unless we assume that those may end
> > up being used by the driver as a hint when deciding which parameter
> > values to choose.  
> 
> "Any values" is compatible with "0 for max-usecs and max-frames", and the device
> can choose "no coalescing".
> 
> "No coalescing" means "latency friendly", but it also means "a lot of
> interruptions and throughput unfriendly". 

To what extent does virtio's "normal" notification suppression
(VIRTIO_F_EVENT_IDX) would alleviate that in practice? At least in
theory the interruption suppression could save us there right? 


> If the device chooses a stupid
> maximum value, it is his choice (spec should give more devices choices instead of
> forcing them to choose "0" which is not the best practice). We can't talk about
> performance for drivers when the devices tend to choose any "stupid" designs.
> 
> We need relaxe the restrictions and makes the spec more reasonable.
> 

Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
those correctly the driver -- contrary to my initial expectation --
negotiates the feature, but does not set the parameters explicitly and
thus keeps the defaults (until userspace decides to set the parameters).
So it does matter whether the defaults are guaranteed to be 0 or not,
and if not it does matter what defaults are chosen by the device.

One could even argue that those patches have been reviewed under the
assumption that the device needs to use 0 as the default parameter value.

Well no strong opinions here. If the community is fine with it, I'm fine
with it as well.

Thank you!

Regards,
Halil
