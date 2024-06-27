Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C113DBB6
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719484663; cv=none; b=pI7bWgG8KAlvhSDQNpYjtDkyIR/QE3k/90v7b4ZKBG4S50vD/WtpLMyJHsbHQBqmWlM5GEmNg+COwsw+qO6inEPFgJIcSoAplbNQ6w9N7ichX/1n5hsOLW+JE+GgjLVTv9YQnfNxYv5V11DrwI8ZZE4N5rP7AuSUHNYBRIK8tH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719484663; c=relaxed/simple;
	bh=tzu9AgrXuY1ktKLvoJFhXH//9Nts5fH6eAYV6Imq+gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YP2QX16cwrRy/p9CN40itcl5/A2Y4n/iWIM8ukUBO6p+YaRqsxPpdF+MiBZo2PKTQD9ZJgObwxqznDL0Ym3LYqmE/MDx67GNvq2RikFHkE5MRNzJnHD75drub2XDDADT3n8qjh/+CGe1VbjEqiXDaQejERNkbGLLfWFFMttgjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hPVP0pjX; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hPVP0pjX"
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R9KHm7031772;
	Thu, 27 Jun 2024 10:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	gFjn8G2Ct0gf+5LN1ySLPLr/gASR85aZC20gurNPjJ8=; b=hPVP0pjXAP3HpOtX
	v6Z1ShQ3eO0wYRyIRzPmmS4DfzAZ5LN7G2/g+SW4J13uHt+buFz8VwbMtvO7EV6t
	3/08dD2Wmc2VcysIe3tkkRaFrQYWoZBlNiXP1SDlEdu6A/7YWxvCFEfhZyrmk1wf
	OP+4NVcJh+GXS9U13wMBdzv+msCuS1GwoWD362PKnsj8fMsYtQqDsPkrCgCt5VfX
	s0bJj+xaJiiPrOA/dy6ZPhFitUx3D03hAjeIMlKD9jE8JQ0Hljz7m0zKmdsSr/FV
	pWxOFVZKYMtdYi6h3rPIA7TchvzAPG1b9zHXSWCmsr3PPfzwWHia/Zz3li/RU65R
	s7iq9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4010n2gysk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:37:38 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45RAbcuH020592;
	Thu, 27 Jun 2024 10:37:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4010n2gysh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:37:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R7pt13000564;
	Thu, 27 Jun 2024 10:37:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yxaena56g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:37:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45RAbXsX54460838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 10:37:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F94F2004E;
	Thu, 27 Jun 2024 10:37:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53C6B20043;
	Thu, 27 Jun 2024 10:37:33 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.152.224.212])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jun 2024 10:37:33 +0000 (GMT)
Date: Thu, 27 Jun 2024 12:37:32 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev"
 <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627123732.0cf541b3.pasic@linux.ibm.com>
In-Reply-To: <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
	<20240610144602.57a04723.pasic@linux.ibm.com>
	<1718026545.7557275-2-hengqi@linux.alibaba.com>
	<20240610221900.1810ea96.pasic@linux.ibm.com>
	<1718102433.0456574-3-hengqi@linux.alibaba.com>
	<20240611122756-mutt-send-email-mst@kernel.org>
	<PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
	<20240613021132-mutt-send-email-mst@kernel.org>
	<1718591277.4770932-5-hengqi@linux.alibaba.com>
	<77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
	<1718869209.8824844-6-hengqi@linux.alibaba.com>
	<e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
	<1718940245.6932242-13-hengqi@linux.alibaba.com>
	<b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
	<1719020069.8729858-17-hengqi@linux.alibaba.com>
	<f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
	<PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
	<bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8tyi_gzvcoLyXP9a8Ha8EV3P06XIEujK
X-Proofpoint-GUID: WgwXOUUtCxUZMhok0KlGGTGLPUAlWeXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270078

On Tue, 25 Jun 2024 18:14:15 -0700
Si-Wei Liu <si-wei.liu@oracle.com> wrote:

> On 6/24/2024 10:56 PM, Parav Pandit wrote:
[..]
> > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> >
> > Flow is:
> > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> >
> > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.

I have certainly understood this differently. When
VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).

If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
to/MUST do the coalescing according to the parameters as described by
the virtio spec.

Michael, Jason: Can you guys weigh in on this?

> >
> > 4. the virtio-net driver even after negotiating VIRTIO_NET_F_VQ_NOTF_COAL, still kept the its dim disabled.
> > vi->rq[queue].dim_enabled = false by default.
> >
> > 5. The virtio net driver enables dim only on user request via ethtool.
> >
> > So here, just because one is using a new driver and new device, it may get lower performance.  
> Impossible, older driver / device doesn't have coalescing advertise / 
> enabled, and new device & new driver with coalescing negotiated starts 
> safe with 0 with coalescing disabled effectively, how can it get lower 
> performance?

Si-Wei and Parav, I think it is the other way around. Without the
change proposed here, with no user/management software intervention
assumed, we are guaranteed to not see any performance regression
but also no performance benefit because of the coalescing mechanism,
because with zeros as default it is essentially dormant.

With the change proposed here however, we open up the possibility
to see either a performance improvement or a performance degradation
depending on the defaults chosen by the device and the workload (sill
assuming new device & new driver & no intervention by management
software).


> 
> >
> > Do we agree to above problem description?  
> This narrative has two problems:
> 
> - The term "lower performance" is misleading and inaccurate, the fact or 
> implication of coalescing is that it yields worse latency, causing 
> additional delay and jitter that would hurt quite a lot of real world 
> workload that is latency sensitive.  So, rather than say coalescing 
> helps performance, it should clearly tell the truth that the coalescing 
> parameter is no more than a tuning knob that has performance 
> impact/implication, being positive or negative it is very subject to the 
> guest workload. So the default disposition or initial parameters loaded 
> from device just reflects the preference of the host admin/ device 
> owner/ cloud vendor of one's own, for e.g. it is optimized for 
> throughput oriented load versus latency oriented. Be noted, generally 
> end users don't care what coalescing is about, they do not connect 
> performance to "throughput" or "bandwidth" as that in your mind.
> 

Si-Wei, I sympathies with your argument but I'm willing to tolerate this
change nevertheless.

Yes the device and via the device whoever controls these parameters can
shoot the guest in the foot, if the guest admin is not going out of his
way to do something about controlling coalescing.

But via the same mechanism we could end up in a better place as well.

Because I assume that the device and its "admin" are at least trying to
do good, I'm not straight out against this proposal, as long nothing
wonky happens with the code which is already out there, in a sense of a
split brain scenario where Linux thinks those values are 0 but they
aren't. Unfortunately can't tell you how we stand on this.

[..]
> > If no, I likely missed something in the long discussion and need to read all of it. :(
> >
> > If yes, few solutions are:
> > 1. A user intervention is must to avoid this regression. The user in the guest VM must enable DIM if the device supports it.

I don't think burdening up the users with avoiding regressions is a good
idea.

Regards,
Halil

> > Very hard to do this plumbing.
> >
> > 2. A net driver enables the DIM by default as long as VIRTIO_NET_F_VQ_NOTF_COAL is negotiated.
> > (without ethtool setting)
> >
> > 3. A device relaxes the limitation and continue to apply the coalescing, until driver overrides it.
> >
> > In my humble opinion, Heng is solving it using option #3, that tends to work with existing and future drivers who may/may not enable the DIM.
> >
> >
> >
> >  
> 

