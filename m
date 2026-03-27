Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA6256C6C
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637278; cv=none; b=TrLu5uu//qYQLspSKS4GH/qJXScTqH7RkkQV541VCsZQ/7KK2QQmdjqE5h6mx5b05YHPpRWp+RsdM8I4DYpx+EGt6v4Ys8VlufJ2Egv7Tnnm7dOFddRKEBEy4zmPuRl53rDRK1l8ON3lirYzD8nev0sRAKo1EQnL7ERmh4sXMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637278; c=relaxed/simple;
	bh=lsmMBo4vhOckdXgHOX3ZQoxsVaIncGPU5XiMF2oNTgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btpNVDSI2B0ZJBlKjSLS0+UR0vEbKoXLeZyX7mNpyyYantHgbwNYOiWR+IgeIqiB0rfAEmPgJr90ToE+GTSVI1MZsnTnM9gt6aC01q05mzqGcyV03KRw4KgjU8PNwE3cX0Sly/dYJwrEXvX7ApuDyuPHHUy9u0Cx8a4qSvpe2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+zprYcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8j2JzTl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+zprYcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8j2JzTl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI38lW1010725
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XI2o0I9TVvwKVK5puLQo41E2
	v/cQxD697u2bSoB8BAU=; b=F+zprYcCWkymHYDG2KztBLsFS+AgRbvFPfX1HAQI
	Jl5pbCZkL0icNEGj08gxjDpZ3N8DMwYJ3u671iQTCeAyB+Hii8vMNm74D0DzDFqa
	aPAsvdp8/lLHTZmSY1ViHlx10f3TpZ+uQg3ph66iVX7K7v5w70sYh0U2bFg8/Hd9
	/bvfzNPhqYqu/hTQwXPv3W1VeofvY+anld4z9XeMGTPp8S6vLk2lw20rOPxo/mzb
	vOhB9d9tGMqUp37yDWg77aky2mxIVZhFGx7VQAN/4pQx5dodWCbNgx8qrk4dFR/Z
	98ITIeIItrzAJfz0qY4OKICOWMpEWXIh5MJmhv/9ND8LGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapucgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:47:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso33685141cf.0
        for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 11:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774637276; x=1775242076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XI2o0I9TVvwKVK5puLQo41E2v/cQxD697u2bSoB8BAU=;
        b=X8j2JzTlTymv2eND0w7JofkWDsqBN7dRRvq64vZnIoClcfUrKjGctkZHLqGGFtKd70
         TlIB95FBYI/fVyh8x2iZ2HX2XBB+/U7ZTNj2cv3iXMcDcQvUNdLjBRJiIM79WfSphqKs
         TTX7tziXudosMFD4cgy/UIbHjVQM/iGti3vx8zrjH+VviNHyUs1WjYVuWJBAXB4jckzU
         GPGjm9xuMZrnQUYRFCFYQ0UsAIMUMXnikQGgifwzha+IZrk2MLsxZhe9biTJbBfGQ8qQ
         8ohWHbFvb5nyAwD6UUHOfKc5n5JTYyzGyuXPa8MRq/jOT9fhW9oyg1scAWmD/fwKk+Q1
         6VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774637276; x=1775242076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XI2o0I9TVvwKVK5puLQo41E2v/cQxD697u2bSoB8BAU=;
        b=Xfov2BsILakN6XLAyoASsNeKgIW+xDpLsclw6cbdBLWwFfub/R6wta8bUU4oTrToEz
         X2CUlWMJmo3OKT8efsOr8pUUqeZROcCVauxXAxraB2TWf842cbBrNUnKoaE4kQ969wFJ
         04AnjXlud7qvsiWK0yUflW9iS0z+T9E6oAL7vQ/DwTBr2oIFsNkXq8oUKwJUNHl3tXEy
         a4GlIqrT56y7zMhtMoqPRKm2Ri0Ltqih28zhY3s5cIkVWOHK5pruHMrgNzcATCGBlrZz
         hp2fexw2+JW3Dl3SFeEKXuHhiQf0/fPhFAP775ibgpnQBexJLg0mVn27BBZ2L8i/VaUM
         JpgA==
X-Gm-Message-State: AOJu0Yz4GWbVY8pdbUcrVNgzRHnF9IZGXTCjZb7NTUR15zfp8Ot536FG
	kGsnwvHbLl45d+RJLMLeNVIsVb51NFFv0/nKLFvVw9GE67/g6LM1UVZkCGgZHUPfVtvAaN6HsSp
	klglBEhLQyUGMZL/0fPthzx5dUAXkV0B5xY2dU1TQkp8lNxuvJ3nO6zrJPoXFfVZX4pvD4Q==
X-Gm-Gg: ATEYQzxF/apm7sFZotJGm/oORaZPARMwG461NLst4XDK0UwC89mUY2nUukYyiAZ3COF
	i1xn8tBBYafy857jbyAzYK7l5hAzKqRjeZONMAc6p40JqFhhgcR5Ui3BSU+ZuVea1nt5tWfU5pV
	5FS+xT6s9SpDCf8Dzf3C+Hra4YC8kvOagZCJApNYQwQdDmGRzxSbjZb00LxM10VtUTbfT1yNiSv
	yQnJ4oLm8ON8l40XFlgESchugGOXTQmYqKdRIjvxGyU5qrW+/OlVBgPo+KZeuatcw02L1DRDRH8
	U05+CGHsAnW2wFGW2Ad+1jg3wVzvfp/c1TRIvArqHqBOXdG0mDQHJ5xMWfUTCwjw9kXALGzZPxi
	yQGY3//AeWPEATIyNmx1BYbWrbHcxvOnPnf84PRIM0wvulSFlkkzyFi8c
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr50106581cf.25.1774637275616;
        Fri, 27 Mar 2026 11:47:55 -0700 (PDT)
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr50106171cf.25.1774637275044;
        Fri, 27 Mar 2026 11:47:55 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6736sm2807166b.38.2026.03.27.11.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:47:53 -0700 (PDT)
Date: Fri, 27 Mar 2026 19:47:52 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <qn2vnj6nhll44tj7skwzp2n6g2su5egyeihozou6pwfcqx2arl@rqajamjsqvb3>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
 <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
 <20260326191118-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326191118-mutt-send-email-mst@kernel.org>
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6d0dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HbbcZFlp_-l1RgM0urQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzMCBTYWx0ZWRfXxZWupBCkjU9E
 ith1nrJUBDThYVmWrvH6ttaovzCvNBiAUNeR8sShNlsE9eKgmOxOf8y5YboheFpzDCclW1k1cpW
 CI+XpswfXnBNQnO1gNddhRL2xvCMn42C0AhvNgcDGPzYAkOevwjSqOpI9PgitxjNHsL0ShL6MoU
 j0OUg4IoWrz49/QtIWwNeTXrxa4NRImtCLMIoQcr0ilCI3t+oCer3lLApI6a4TfU2iYuo+ZW6ZQ
 SILQwmd1JpPejYvgl/pYIcgNcLy6AxYsS++6ril2nawhHmlP8OBShIO/SvmlwI0VSJMNeijLrZF
 KvH+YfWxY+KwpK1wHnvIOs8BeTnwaaYbgeQQm9KnYoamzTSLrR7qosPbDAiUuTOrKbZ6VC0eSpP
 eDdYJ4JaVkUVVsn6zbchC+GcZI1iqi3MI8JsuXwC5zwhhbp38cCXnk0valMMgpMwZSwIhRXXGRn
 2d+VD5b3fKFmYjKFdeA==
X-Proofpoint-GUID: wX6FIcWoi0DgGIcRpdU7qaRtpA-E3WuM
X-Proofpoint-ORIG-GUID: wX6FIcWoi0DgGIcRpdU7qaRtpA-E3WuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270130

On Thu, Mar 26, 2026 at 07:13:59PM -0400, Michael S. Tsirkin wrote:
> On Wed, Feb 04, 2026 at 12:50:22PM +0100, Peter Hilber wrote:
> > Let devices using the MMIO transport avoid stalling the driver (virtual)
> > CPU during device reset, which requires introducing a new MMIO transport
> > version.
> > 
> > Unlike the PCI transport, the MMIO transport does not require the driver
> > to poll for reset completion. This requires a device using the MMIO
> > transport to complete reset during the write of 0 to the Status
> > register. Device reset may take more than 100 ms if it involves
> > terminating ongoing device activity which accesses driver memory. When
> > the (virtual) CPU writing 0 to the Status register needs to be stalled
> > during this, this may violate real-time requirements (including those
> > for hypervisor trap-and-emulate).
> > 
> > Address this by introducing a new MMIO transport version, v3, where the
> > driver must poll for reset completion, and, hence, the device reset does
> > not have to complete during the write to the Status register.
> > 
> > For clarity, also add some related requirements for v2. These
> > requirements are implied by the rest of the specification and therefore
> > do not alter the v2 semantics.
> > 
> > With MMIO transport v3, reset essentially works as with the PCI
> > transport, and the change is therefore not expected to cause problems.
> > 
> > Existing devices with MMIO transport v2 are not required to implement
> > v3, which will not work with current drivers. Drivers have to support
> > the MMIO transport versions of the used devices. Portable MMIO transport
> > drivers should therefore support both v2 and v3, which is simple.
> > 
> > Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > ---
> >  transport-mmio.tex | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/transport-mmio.tex b/transport-mmio.tex
> > index 94a93a1..6504a6b 100644
> > --- a/transport-mmio.tex
> > +++ b/transport-mmio.tex
> > @@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
> >    }
> >    \hline
> >    \mmioreg{Version}{Device version number}{0x004}{R}{%
> > -    0x2.
> > +    0x2 or 0x3. With version 0x3, the driver waits until it reads 0 from the
> > +    \field{Status} register before considering a reset complete.
> >      \begin{note}
> >        Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
> >      \end{note}
> 
> But this means there's no way to support existing (non polling) and new (polling)
> drivers both in the same hypervisor:
> 
>         /* Check device version */
>         vm_dev->version = readl(vm_dev->base + VIRTIO_MMIO_VERSION);
>         if (vm_dev->version < 1 || vm_dev->version > 2) {
>                 dev_err(&pdev->dev, "Version %ld not supported!\n",
>                                 vm_dev->version);
>                 rc = -ENXIO;
>                 goto free_vm_dev;
>         }
> 
> 
> 
> Don't we want to?

In my understanding, a driver can easily be modified to support both
version 2 and 3.

My assumption is that if a hypervisor requires reset with polling (v3),
then it cannot correctly implement the MMIO v2 reset semantics within
its operating constraints, and therefore must not advertise v2.  For all
device implementations which can work with MMIO transport v2, there
would be no incentive to upgrade to v3 for now.

If a hypervisor prefers reset with polling, but does not mandate it, in
my understanding it would have to use an out-of-spec mechanism.  Maybe
the hypervisor could offer both v2 and v3 devices and add a device tree
property to the v2 devices telling that a preferred v3 device should be
used instead.  But I am not aware about such a use case.

Thanks for the comment,

Peter
