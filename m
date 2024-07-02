Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3851CD5DA
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719956618; cv=none; b=lF/ICFmZhuTp9gY58Cg4QlQQNGiWQnlWRU+rR0567hDxTh0qPq3KoRMbvgS6hbtg2S+17tPwRCv4P7f1N8cAQjuMEACiMIXzgDooBx58n/kdkPd7hXCEPPWZKU9CuhTFyUPCpV1Bz5mipd/6YloGzv6rvG/y7HACwVLh7vWLrf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719956618; c=relaxed/simple;
	bh=m/duJ/vzNXt4WhpO4CFQgsnk8BKLGt+fx09INsPjxzc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wf1O/NksEmhASy8V+Ja/20ZVOOzf8gFgcETybMSLLMluWdJW3hJZTkLhWp7D5uTjwnIdSdTOUVSPmFpTVT1ispl4nuHvlwrEAqPavM1FoNsHgv8qxsSKieSACd0BRvD7m8SavHPq4zlwKrsSgTQtVAZtJ4prRVKyB0AaLClR/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X8y1FMrj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X8y1FMrj"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462LT1Kh016816;
	Tue, 2 Jul 2024 21:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	OtzyCTySjCd0G4+HRrsM2HNfEP003RF7Jy6gJ7xfIlo=; b=X8y1FMrj+iBnJvjg
	5bVbUaV4+XCU4vR8q3aQjbxm07SC0Ti/14V5Bn7cidX1zlMXvsw0QTL/r1Nt1nyq
	13GFVHGz7gRO/bPmAZn9R0da+HLGNnO7zXnwHWZTjo8PaNVCRytN9IJpTXlLBZWK
	DPj61TQ2NT8/oTmhpBs20sGf/RNjnKLGANgFUT9oFtBm3QXnBuSp8Abq9H6ZP+L0
	1jrdBCyLgU2lwKh16R5G7i+VrECGXVhawxRuO/1RP95Nrr4o1pm/UFOYFwOkjZ5o
	zfxd8Wjr5KYqnCQgyuv5xmUQ/XhFeeCd+38CBVY6G2ccUXff5lyVWKUYFCsMXEU3
	crpIDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404sga00nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 21:43:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 462LhXxn005602;
	Tue, 2 Jul 2024 21:43:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404sga00nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 21:43:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 462IrU19009473;
	Tue, 2 Jul 2024 21:43:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 402xtmpvu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 21:43:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 462LhTw345351252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2024 21:43:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E547320040;
	Tue,  2 Jul 2024 21:43:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F3D220043;
	Tue,  2 Jul 2024 21:43:28 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.49.148])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  2 Jul 2024 21:43:28 +0000 (GMT)
Date: Tue, 2 Jul 2024 23:43:26 +0200
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
Message-ID: <20240702234326.79fa6d6e.pasic@linux.ibm.com>
In-Reply-To: <20240630125153-mutt-send-email-mst@kernel.org>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <20240629084747.1d173908.pasic@linux.ibm.com>
 <20240630125153-mutt-send-email-mst@kernel.org>
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
X-Proofpoint-GUID: UuTMk5We17euDtRxoJP2rw9yVaUbefLv
X-Proofpoint-ORIG-GUID: 5E3Rqkm1D2ma4UfGrrHDfQCqNLFCgyc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_16,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020158

On Sun, 30 Jun 2024 12:55:35 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sat, Jun 29, 2024 at 08:47:47AM +0200, Halil Pasic wrote:
[..] 
> > > > I have certainly understood this differently. When
> > > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> > > > 
> > > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > > to/MUST do the coalescing according to the parameters as described by
> > > > the virtio spec.
> > > > 
> > > > Michael, Jason: Can you guys weigh in on this?    
> > > 
> > > I still don't understand why this change is needed.
> > > We have this text:
> > > 
> > > 	The device may generate notifications more or less frequently than
> > > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.  
> > 
> > The less frequently could be understood like due to notification
> > suppression.  
> 
> I think you are missing that there is a separate text about notification suppression
> immediately after it:
> 	A device SHOULD NOT send used buffer notifications to the driver
> 	if the notifications are suppressed, even if the notification conditions
> 	are met.
> I think that makes it clear this text is separate from suppression.
> 

No I did not miss it, and I don't think that the two sentences being in
adjacent paragraphs makes it clear that this is separate from
suppression.

For me the "notification conditions" part and the "even" is making it
sound like normally meeting these conditions would mean that a
notification should be sent but then notification suppression overrules
that, so there will be no notification even though if it wasn't for
the suppression there would be one.
 
[..]
> 
> OK, I guess we can clarify:
> 	in particular, the device MAY coalesce notifications when
> 	coalescing parameters are set to 0.
> 
> will that make it better?
> 

I don't think so. Sorry, there are things I would like to understand
before committing. Back then when I voted on the coalescing I convinced
myself that the interaction between used buffer notification suppression
and used buffer notification coalescing on the TX and RX queues of
virtio-net is specified with enough clarity. Now I'm asking myself
if I came to that conclusion along the lines "nothing else would make
any sense, not spelling it out properly is not tragic". Please
see my comment on Jason's proposal.

Regards,
Halil


