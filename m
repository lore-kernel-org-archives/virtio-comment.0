Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E11DDF4
	for <virtio-comment@lists.linux.dev>; Sat, 29 Jun 2024 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719643681; cv=none; b=VebZzEdqygc8JEhPNiXdyhWSKhMhDnCSMNtumKOVClyCp2KpFH6kdQ1mzvgLB/6ThotLFYsdSe3/rRamg6qRD/H+AC72Vls/DMHmzEPo2SsrxPjdXfcfp1bmfMkC9UWhVuBb8tagZ0BOvJuDMZ0QCCIbRs6eW9Hl/SczdQ8p5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719643681; c=relaxed/simple;
	bh=Clz4299DST+g+XYjeDCgyzU6dbaF3ACF1IyW6uSMHv8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lxhl/z6oL1JYg4cuOSfaG2fr0oFCQx3WDjV6TQZYCavjnUFF0W951XV9J6YkMk5KH3BfGOy/DKrPNTb5q0Hh4VMpV0iIQKNSwVojsuBjelidPjgQQVwWOh5SfP/TZFVYmarYHd94axN4NNlh4XTJT6hGpuzaVlLlqMQ4dKM64gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MQNBObgL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MQNBObgL"
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45T6Q0CN009029;
	Sat, 29 Jun 2024 06:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	CbZUS1C+EKrIQB6GPUYso1Zk3K1eTtQ2bHhlRFYlmFk=; b=MQNBObgL+3XIwvtO
	DYvRcB1HuEcJbxhHz4kuariX8LftQRZfAoPNQ7ZJAipQmvpa6QpP2vFWxfAOnqZA
	oqWuFOZJpvGlw/qPagoeF1JNs4ceDqCbxmtFvmn3q/ataCpdyCLNE5+986bnH8wo
	ZIhiurf1ciZGof9jzmUPLN9yAfmlFs78SGN/wT8GVcWipQ/uvP+U/FWEJgq0Schg
	/3dPNcypHM30VVPYVuB4zgJZFnTDxVg3mzdGZ6ILWY6HsrzTGBfeFIH2dh9ZfK90
	HXtRVUX6PUlll2x+zfdbtswrt/MBN4UqPZJKeeD30IkPVIFsgmKbFvoDUsE58xI1
	uzSgdw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 402c5hr3hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 06:47:57 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45T6luY9008032;
	Sat, 29 Jun 2024 06:47:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 402c5hr3hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 06:47:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45T2PQBu019800;
	Sat, 29 Jun 2024 06:47:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5n45rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 06:47:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45T6lq1m47120670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jun 2024 06:47:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17D1520095;
	Sat, 29 Jun 2024 06:47:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9010A20093;
	Sat, 29 Jun 2024 06:47:51 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.82.129])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Sat, 29 Jun 2024 06:47:51 +0000 (GMT)
Date: Sat, 29 Jun 2024 08:47:47 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Parav Pandit <parav@nvidia.com>,
        Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason
 Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Halil
 Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240629084747.1d173908.pasic@linux.ibm.com>
In-Reply-To: <20240627080346-mutt-send-email-mst@kernel.org>
References: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
	<1718869209.8824844-6-hengqi@linux.alibaba.com>
	<e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
	<1718940245.6932242-13-hengqi@linux.alibaba.com>
	<b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
	<1719020069.8729858-17-hengqi@linux.alibaba.com>
	<f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
	<PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
	<bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
	<20240627123732.0cf541b3.pasic@linux.ibm.com>
	<20240627080346-mutt-send-email-mst@kernel.org>
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
X-Proofpoint-ORIG-GUID: Rsafb1xyh2V0dpGL501aOugxEh-Df1En
X-Proofpoint-GUID: t8M9LKkskGVtIaBOmglrGKfkACeHY78p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-29_02,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290046

On Thu, 27 Jun 2024 08:35:16 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > On Tue, 25 Jun 2024 18:14:15 -0700
> > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >   
> > > On 6/24/2024 10:56 PM, Parav Pandit wrote:  
> > [..]  
> > > > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > > > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> > > >
> > > > Flow is:
> > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > > > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> > > >
> > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.  
> > 
> > I have certainly understood this differently. When
> > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> > 
> > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > to/MUST do the coalescing according to the parameters as described by
> > the virtio spec.
> > 
> > Michael, Jason: Can you guys weigh in on this?  
> 
> I still don't understand why this change is needed.
> We have this text:
> 
> 	The device may generate notifications more or less frequently than
> 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.

The less frequently could be understood like due to notification
suppression.

> 
> and
> 
> 	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> 	the device MAY generate notifications more or less frequently than specified.

To me best-effort implies making an effort. Here we talk about
intentionally ignoring the parameter values. For me stuff like not being
precise about the counting or timekeeping, or running into the danger of
having to drop packets because the queue is about to fill up, would
qualify as best-effort deviations from the specified behavior.

I believe we want the drivers written under the assumption that the
workings of a notification coalescing in any device that implements it
are close enough to what is described in the spec. Just my opinion.

Regards,
Halil
