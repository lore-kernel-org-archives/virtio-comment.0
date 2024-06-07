Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FA33EE
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717790577; cv=none; b=X/AGmAov5NIZbvndkMCyP2p2b8kVzV0bCoaMYod/5rOBjiiJ/xXrYks4i6UCa1/nXHgs+mIGQzc0Ez53b27AH96n3KNPWki8BzCI8FxnZVzRnd8ok6PihoZkus3kVB45iLWAZmJ4QdAl+7UlofftV/dl/HC+KA3UyujBg76FWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717790577; c=relaxed/simple;
	bh=sB4+6h5Zmw/+mbHVilRxFO+WpWIDSBdHQwFJah6a+3w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R344m2GQK7D2+lzeLP7dzSw9kribHCGi/8maUoWvjLYe1p7QtxO83GuNKwfJ9BCs/PN3E4Ls3R240VnC7U57gLIrNmyUFT4fOzg+rNK+N5TKjs86HjtpaJhjQNH52nv9Rh1V/NuirulLaea3M44ouCQf3Lupyt7EefJEdRtTfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hbsxxRpo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hbsxxRpo"
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457JusSx015317;
	Fri, 7 Jun 2024 20:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=VPuL9mDdjhnARzVpQKlp8XKr26QQtSgYzS26cQVP9BQ=;
 b=hbsxxRpozNvF/aSvSCR5oLcFsO6P4BgbT7/it+XppjiR7yERIlu2hkl5G7A1G7brxISo
 ZFuAbAzTjhuG6i7OExgHAFUCjwjV/MsV7lvC7fk4cWs8oUYulJDsu+7fQ5cnWAHuz4OE
 0CHCdI4Ge7FWjCbYu/URjCrgrJMsN4oOJ4AePZlm0jCKOmGTO1HZtgd3N35ZSTy/4cfK
 0r6LlWNFDHeF5eLQv/uVIMrt0goSeIfl7K2llMEnQKCq4ewSwNHHUSQtCe2j+8PHRJVN
 ptcZzzy1pBtgeWDSWjel+NnHmwgxM9bPwXCdcZ+dWmUZ4smcovcmgf/A2gahZrrfOTm0 bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ym8tdg0jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 20:02:54 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 457K2rTI025646;
	Fri, 7 Jun 2024 20:02:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ym8tdg0jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 20:02:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 457K0Ggo026674;
	Fri, 7 Jun 2024 20:02:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffnjdck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 20:02:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 457K2m8f22348240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2024 20:02:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 628FA2004B;
	Fri,  7 Jun 2024 20:02:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C20CF20065;
	Fri,  7 Jun 2024 20:02:47 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.56.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  7 Jun 2024 20:02:47 +0000 (GMT)
Date: Fri, 7 Jun 2024 22:02:46 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240607220246.3213607c.pasic@linux.ibm.com>
In-Reply-To: <20240528044702.50603-1-hengqi@linux.alibaba.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
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
X-Proofpoint-ORIG-GUID: 7La32Zy9TIDR_rDhQ0AVqvdIhV1Et50P
X-Proofpoint-GUID: wz5hq40993dM8yvAAWV8aLnVp17FMGM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_12,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070147

On Tue, 28 May 2024 12:47:02 +0800
Heng Qi <hengqi@linux.alibaba.com> wrote:

> The device can set any initial coalescing parameters (0 or non-zero)
> for the receive/send queue before the setting command is executed,
> not just 0, enhancing device performance even without DIM enabled.
> 
> So we need to clarify descriptions that don't fit the behavior.

Sorry I'm late to the party -- again! Just for my understanding: how/why
is this a clarification and not just a (basically incompatible) change?

I mean if I read this correctly, before the driver had the guaranty
that if the parameters are not set by the driver, negotiating the
feature does not introduce any coalescing. After this in theory
the device could just pick some max value and potentially introduce
maximal latency in certain scenarios.

I understand that it is probably in the best interest of the devices to
not pick stupid defaults. But it is also probably in the best interest
of the driver to set those params, and if the driver is going to set its
values, the devices defaults are moot unless we assume that those may end
up being used by the driver as a hint when deciding which parameter
values to choose.

What am I missing here?

Regards,
Halil
