Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197346;
	b=b0wAEv6kNJpDxpLtzeZz/orunD0vpKKGLb6g0OZCk9zxG6Bt/1D6E3q6x66ymssqyEbk
	 Fru8+B0b1es5j14dEi4LQlNYQjKvl7LMVtXQdh/OiPKpqBOvjeBT0HWIfvHwjeGx0a3zK
	 shC4tpcqW07yRzqmWWsVn6pobdfjmS+ZIkGBzuF9jPb5MUhJdqSlBfaVEbEGtFrcZ/G35
	 S/oEnrIRA/orYtm/9rXsRWr8J0sMRBFlWL1euW9HJGlCcD01ORqv1m/LYnC1Foz9nypZx
	 F6bZbDF18/bWJIDHmjhOFLFf2iDvrxb1hXzSNH6iu20jUFgAncLQTUZGv+zCKVt5Zow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7l7GyTaeQuBGIpr7LSxB3lK+iJgpb4DpSYyg9vkI+qY=;
	b=he4zpQCKwU4YuYdOWKMCnjq49cOWtsrw1aFW7QuAy1VoDT/m6w//pAPn/m6plLoRAVkY
	 Ubh35LhIMLkts3vapVGwfzFeoW8wzdjVjMzp+4bfk7wkuaCoptjEsJo0zzLWks72gCHl1
	 7Z6LIG6xVpzL5L85w+33Q2gbYVMMjUp04cwaPaYU5TGlyrv/8mW4iFZURgamZe1cNbxbj
	 aArmg9yS6DfRGfb9XlZuk55mJ6OuJYZybQMf/dXE51sI/VHQum/XVhgLzRcYXSxrJDkrI
	 s5V/y4bb2NuZqfTaiPW+beTJJOVNcoJOhG5lfNjk+zjIA+ZN3q3sA1zBqJ82eLx8tMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hg6Gnr1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvlGmhX9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B2606A31C
	for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 14:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hg6Gnr1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvlGmhX9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4MI2082635
	for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 14:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7l7GyTaeQuBGIpr7LSxB3lK+
	iJgpb4DpSYyg9vkI+qY=; b=hg6Gnr1pSqXROetYlJ5LS1NWQp8D1Q8w3oRBZysG
	B1g9xNvanjFDNlOlnBuZ52J8y0zH9paFzNnUB5w3TIRK/F69SOtuiWwsQ63/Q8TP
	Wq776BzRltHnmX6NHDgTWOmWm9sb0GGpHfKGzIoI+G5SbEu1JWo8Jrz50Bwn1Kmc
	KoURFdcw7fSYb/ZpumGvGntKYORN4N7XeVxLSuEhJl5wN5cZg7Q9/ctSrhjuf7lS
	Whfg9U0SvP7yokr6NXJXO8B4Es5pU7ONMH//eYF8xXPXfjHmxEq7iKmJ8m97Hw3k
	pjbQfPJD0ay4aqWabZWugwfIzhzeic5ytKo66wpXDC2isg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvdnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 14:22:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907de400a6so246162241.0
        for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197344; x=1793802144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l7GyTaeQuBGIpr7LSxB3lK+iJgpb4DpSYyg9vkI+qY=;
        b=ZvlGmhX9e/JFSNVAsOX/brU4/y0c4D+Xsa+72hlGRAISkri4ODIR3/+dV52rwaETkp
         mmIe8rPRNKjo/wfP0FZ22LBj+UiaqDtcPKThdqvzhtseQqEPkM7Kp0jrWEb5WApIimnY
         Z6jqGGVxyBR+pW4sJtVhvJZR95OALEQZx0KB+80zlLeQ65gE47cvijrZEXFnVWfVOKej
         zfJGHD4NMobcuMRAR9AHhcJq1IYewmSrtJtngrELcE+0RGKWSC0QEDj1u2dO0l1NlanJ
         GnkanwL+gQ4pMJIaWs1zExmS6d+AfyTcIA2jyeiryuPLZSWZXn8PRkVyf2gBOC+tQS23
         46YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197344; x=1793802144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l7GyTaeQuBGIpr7LSxB3lK+iJgpb4DpSYyg9vkI+qY=;
        b=h9iwI30nHR4sF+v7kwYEMvt/8VIiS8y7z7mX790Zl/iRKZDbv/akpFNNffSvFMtb5q
         8itOK2NJVG5K2Ru19uU8GmdlHGYYkyfd/J8vohWKgyGBbum+JjchW2FOTIj6TFa1vLpi
         P/DiaDp+yCjetKGVtPNwc71RdjJCb4pGGLL5EZxfYEiAd3On2sJ8WnbhVNUT/IhGtw+B
         D+jG1aMBSg1JvmT/HHjYqe+b4mGif8wrZeyghvEASa8sUmjfhrmciUIyVs0ePSBTyWW2
         lNKuFYsu4XYPZ8yF6UhRVmR4HFWbKo2kx+3rkdINm5g27jCvIap9IpTrFMXw/o8PqLr+
         iXWA==
X-Forwarded-Encrypted: i=1; AKwUvByK341QmiRgixOY+X9MwYeEVoOn3YslNUzlUXRp1YWyFUzUgz5Yi4Z3MZuFNa4oBDERZUlK22w8evD+lqF1uA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKiMdIsVDbvuXLiUx/VApl6Drl/JnIHGN2B/nptehbCzaKL6CjL
	kmtANwdr9636L7vOUvxlMflpEV6BABmq+1dccAPJhZ0Vi5soRz9fhETySI37CtsymsGnfi+DVjM
	6irS+rVajW1HKxR4PgMaQjugEjJVLRSLLYRMpqwNmkpbpbreaFoNJAP+tFuNZyHPjIVbKOA==
X-Gm-Gg: AYBFou383T7xuEy0HIJVW2WTjZfFSouVC97EdtpnbtVeuFy7QVoly4bdFB2EmXAbqf9
	fBV8lHrGo3wlfbnN8JlniwWIB6tpmvnVl7plIk5AAKDx4XkQFZSvq093xyl9M1EpIARB1DR+4aF
	0+SCowMVj8thF/4KFAk2uypjx88e8BYiUdDhuVshyG3CDToorwc1nyVHpqHv5ob0DEqAQn+5Rd5
	+skdtDL3/5BvyH7w003OmeiYImMO795kKCMjL5PBBFQ51mIKYGWnsbTVLNCm/gEs929QO4uiTDb
	rgUj0zCzSPDcRJ1lKSFCyjFp3/cvLzwzWquRuZZzJS6QyjkFdMoOsDC1hp9QbxELSnaItf6egPp
	Dpx9oG3mnWaCNEJPvqHdn4C8qRRDYxuDQll9IJr5Y6LUfGnGbwQsym1xxIfhTnoohyu8+4xQLkE
	GCbsE+ydzi
X-Received: by 2002:a05:6102:4415:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7d03a627a55mr946571137.32.1793197343700;
        Wed, 28 Oct 2026 07:22:23 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7d03a627a55mr946531137.32.1793197343199;
        Wed, 28 Oct 2026 07:22:23 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f1ba0sm43920765e9.11.2026.10.28.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:22:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:22:20 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
References: <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wyo3557.fsf@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX7URTP8bAD7JZ
 3+rz3MFTpcxy9dkVlngG5wcRlMa+CM98IGI80b5Y7jYpqz8KGpl0YK4n545B5chJbEZwZZNyXjm
 glZaknwO5ivytyo4dpCpgNFNvC6/ci2wvPWzyU5pi85R4xDhsv3Xc8aQPCYFTJqmxnZae/Nz6HH
 jWwNPomCRRoH7D8SjjG2aep1HK8eYF++9UnZhys+04KEitkSgZpAuwIbZfnKpDxlAxfFq+Pk+c0
 h5g8wXv09oNkylF5orguTc6QCHBai3whEbC+48ctQhQmB/NcqzRSn1isZDt4flfIRmXGCu2Tnjf
 bqxnlfg/Oduqojji0bkdN2nh+yqbyZGHEVGIPjC2YaeSCsYn/n010QlZAru16XbM60g7m/ZgsKU
 uAcDNtQ7uFo9ieJVbzcEC7Q3B1zLHqlfhANfUYeFcPf98AgErcr036c8cckC+VPDe8LfN3Doxla
 KGRXfQKQSUM+Qr2RXhg==
X-Proofpoint-ORIG-GUID: pew36iLB_EPASudOy2qocHe0tLnIV9rm
X-Proofpoint-GUID: pew36iLB_EPASudOy2qocHe0tLnIV9rm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX78rkmUxdUaV6
 Oia31VArsYsVJoPURUqwCp8EOzmMyJ8obxcGweHe+xZkgi6bQf9687JQx8zIgjZUuCQAPSVUN2p
 vEtXMugktkB86O6Q2jHnIt1BR/2YbR0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae20520 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M67odIltsXBS_ADZJLwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Mon, Oct 26, 2026 at 03:31:16PM +0100, Cornelia Huck wrote:
> On Fri, Oct 23 2026, Peter Hilber <peter.hilber@oss.qualcomm.com> wrote:
> 
> > Qualcomm's intent is to upstream a Linux kernel Virtio driver for a
> > non-standardized device using a Virtio transport [1]. It should be able
> > to work in a vanilla Linux kernel. I think this requires a new
> > "vendor-specific" or similar device. The driver needs to avoid
> > collisions with other devices and must not take an unassigned ID.
> >
> > I think "vendor-specific" does not capture all possible use cases for
> > such a device, though. It could be a "self-assigned" device, e.g. for
> > prototypes to be standardized later.
> >
> > In the discussion, it was proposed to distinguish "vendor-specific"
> > devices through common configuration space fields. I would suggest to
> > use a UUID at the start of the configuration space of the new device 52
> > to distinguish "vendor-specific"/"self-assigned" devices. Everybody can
> > generate a UUID when needed. This would
> >
> > - allow everybody to create new devices without ID collisions due to
> >   using unregistered IDs
> >
> > - allow using UUIDs for prototyping, with a new one available for each
> >   breaking change
> 
> I would prefer to have a namespace for this kind of experimentation,
> i.e. <testing prefix><uuid>, with vendor or purpose-specific devices
> using <vendor/purpose prefix><uuid>, so that...
> 
> >
> > - be a way to resolve the device ID scarcity
> 
> ...this would still hold (I think the most limiting factor for this is
> actually ccw? not sure how much we care about implementing new devices
> on ccw, though), and...
> 
> >
> > - relieve Virtio TC from some device ID registration work.
> 
> ...this would also still somewhat hold (no need to reserve an ID for
> everything, but if you're serious, get a vendor-or-purpose prefix.)
> I'd still want to encourage everyone creating a serious device to go and
> try to standardize it.
> 

I am wondering how these namespaces would be managed and used. Would
introducing a vendor/purpose prefix require an approval process in the
Virtio TC? Would new standardized devices have a "standard" prefix when
using ID 52?

Could a device UUID transparently transition from testing to
vendor/purpose, so that drivers would only match on the UUID? Could the
namespaces be seen as a quality gate so that testing-prefix devices may
be refused in some circumstances?
