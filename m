Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213911946A9
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577483; cv=none; b=l6aKppolDdAui6rX0zMoElQqP+kyIsNJcSIqEbtKCu7RC+ZAXEfMsTuwuAH6eFnV+fh0iakBLIlh+s6SMbWHJUraWai6apwG64Uj1PXe3DyNCf79FNsVGOzIuC7rEjIs9ER9i4EKIrzFYAa2Je/6rEtVIfrGezIXu4y0x1d4qiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577483; c=relaxed/simple;
	bh=zGfZ7/p0O0sJm2pIpCeo8mnrnPaNKaR8MpyEoWjHqOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uiUPZ7sJ1OkVetQidAo6MmEP1SgE32VYxm1EfxiNvMPDtqdrZ0ua8hlyt4nvWZmdOMFoHYIb03IEXYjd9H05A8LCRt/Fq625NiFFCOz3dCCGEo04dPT+L9U/n9Aja+91NHdsgKB4zjXuJ4LwSI/yE/1kjRkgeyWBvYAIsJs85u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hriY2srm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hriY2srm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717577480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zn0U8xmr/EnVANKcgZ82lqMhUwoBwQdgSw4RMajxrV0=;
	b=hriY2srmoAIRi/8eDOtfkzLAXJc55GMFfFBuT2iqotQ60QWLttGg9enlWgZrPH3eIZnfNy
	xBuWw8Gm+JOHWyGRmAz7eyO6Fk9CKZH/fCudJ9J91NhukPvB4kth2w5WCUrv7uqvRDBeqY
	MNM1EV9Hen8XujJkBYN7kc3UOqfYfUc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-UYmSTPShPnyLGszw8jxFyQ-1; Wed, 05 Jun 2024 04:51:15 -0400
X-MC-Unique: UYmSTPShPnyLGszw8jxFyQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6905050583so160375466b.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 01:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577474; x=1718182274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zn0U8xmr/EnVANKcgZ82lqMhUwoBwQdgSw4RMajxrV0=;
        b=mwp/OIwlR0DADQg4sxwtHNil9H0PWLsqUSyhl6/Bp46iTvGMINQhIqD5MkaQAw5Y/G
         jiqWa2cojdJ4laCSgwvhcWls7Gzos06J5PthFDT6L8RhdU2DiQHGbRKJXmAqw9vrFis2
         w/wmfdDTP9j1KhlSLUDJS/h57cw/jI1XVn6lBcTG0VO1Srx1L6K5q6NPP5OyrzHdytTn
         uRvFJF8QnBBM13eV2LOcqoyBwDkqZq4/J1xg4X69P3DTQ284GtquHMME6gVJp8OQ/lnX
         qRVDPD4rDZr4MH1jDPq+Zh8deEMpXUX+M3mk1tH/ez+oeN4K9ewT0kI4xOi9JfhWSAzO
         w2lg==
X-Gm-Message-State: AOJu0YytnGfdwlNl+Q6iQmAwDrvq0MEqzNvlUg0yTB7EPVVSxxIH3PHH
	UdK/I/Dr9H4eHfChECYHXc7hJI+tGU4RiMPH3tLjNdDcetmnJQhVmRpdK8Itd14rRCGLCbB/fn6
	A1zHJ3pSO/SKpJ/b2fqiiI3eb7l1KnOXdqq2vqhAZSQAvHILtoeNHn5/KocEq7sTNs3LCpgo7
X-Received: by 2002:a17:906:774e:b0:a69:b5:def2 with SMTP id a640c23a62f3a-a699faa9004mr122346666b.6.1717577474016;
        Wed, 05 Jun 2024 01:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu/3rUZhG4LnI+EbhQBoQmEBYN+OFG5ZZNvMZ9OPJWfL61I2Mz299XmAE26KKO4E0AgcW9kw==
X-Received: by 2002:a17:906:774e:b0:a69:b5:def2 with SMTP id a640c23a62f3a-a699faa9004mr122344666b.6.1717577473532;
        Wed, 05 Jun 2024 01:51:13 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b2ed4294sm608702866b.21.2024.06.05.01.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:51:13 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:51:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 1/2] admin: Refer to "no order constraints" only for
 different queues
Message-ID: <jedmes2fxcwdo3gomq4uggxtnnobuhf5hoccqojsmi7wsjvpxl@r2jdfurg6gjf>
References: <20240522174505.57675-1-peter.hilber@opensynergy.com>
 <20240522174505.57675-2-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240522174505.57675-2-peter.hilber@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 22, 2024 at 07:45:03PM GMT, Peter Hilber wrote:
>The non-normative section says that administration virtqueue commands
>"will be consumed with no order constraints". But actually, the
>requirements stipulate a total order for all commands in the same
>virtqueue:
>
>	The device MUST process commands on a given administration virtqueue
>	in the order in which they are queued.
>
>	If multiple administration virtqueues have been configured,
>	device MAY process commands on distinct virtqueues with
>	no order constraints.
>
>Fix this by narrowing down the scope of the sentence to "commands placed
>on different queues".
>
>Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
>Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>---
>
>Notes:
>    v2:
>
>    Be specific about case without order constraints (Parav Pandit).
>
> admin.tex | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/admin.tex b/admin.tex
>index 0803c269e5c4..fdbf2ac5a93b 100644
>--- a/admin.tex
>+++ b/admin.tex
>@@ -457,7 +457,8 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
> The driver enqueues requests to an arbitrary administration
> virtqueue, and they are used by the device on that same
> virtqueue. It is the responsibility of the driver to ensure
>-strict request ordering for commands, because they will be
>+strict request ordering for commands placed on different
>+queues, because they will be

Should we use "virtqueues" instead of "queues" since we use it 
throughout the paragraph?

However, out of curiosity, how would the device impose an order to 
commands on different virtqueues?

I'm a little confused. Also, the example we have next doesn't talk about 
different virtqueues, so I don't know if we should modify it as well.

Thanks,
Stefano

> consumed with no order constraints.  For example, if consistency
> is required then the driver can wait for the processing of a
> first command by the device to be completed before submitting
>-- 
>2.43.0
>
>

