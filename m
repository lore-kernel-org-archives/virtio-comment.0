Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF54696
	for <virtio-comment@lists.linux.dev>; Mon,  3 Jun 2024 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717378848; cv=none; b=gZ6qirJnKZXXKLakX3WTXirzY1FOUrrG6ZXzUWsMgQ79lOjqGIVpcADE8A8SBQ6vBw7jrPQOWwmaq8TH7PsJwJtRHFUPMWr/dvIG/5/i5IcgpSjHX85m5LXb9QCAKqbynbILV+gQSNPcM2MDtVwRZdRETvXmC80b80j1iqf6+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717378848; c=relaxed/simple;
	bh=WiIC+Xrf+9bTDwHLek+mPzCnqnrXYKX4BqtQa84Iu3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgZ4NZ/VShvDmMRfKqitOrleH8cgY7nrE8IcjsnnXi5YBnlO2p5rSFxd06zmIedc6opyoqg8Vi0KOCaE8Y3A3clddMlqhLKbFJbt0bg6bbT0xX1HyjTIOzNSuk3Gd5ptB3BfZo6+MaIRjHnURUwAOc57iH4JnXYyRKxso/z1L8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ft/Oc07q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ft/Oc07q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717378846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiIC+Xrf+9bTDwHLek+mPzCnqnrXYKX4BqtQa84Iu3g=;
	b=Ft/Oc07qgVXowAcMLU/Co6jNMj0WCvNR6D/vZ04XWa4pB8nKLo+FFYeLKcx14Ui2RQm0qd
	xHj/X4EBYe29mJODituEzUtBjR8oYHD/KrAOq6fmYYf6nvCVLIxjPzs4j3cY5os1eXkqF7
	f4EpfPRyH6JWASc2TBzAbU/Ong3UICU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-9HyT1xLeNm-hcsFUY1j3dg-1; Sun, 02 Jun 2024 21:40:44 -0400
X-MC-Unique: 9HyT1xLeNm-hcsFUY1j3dg-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-6cebd09196bso213436a12.2
        for <virtio-comment@lists.linux.dev>; Sun, 02 Jun 2024 18:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717378844; x=1717983644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiIC+Xrf+9bTDwHLek+mPzCnqnrXYKX4BqtQa84Iu3g=;
        b=bIth6x5qVH2JE6iE/UKzU+D8igtOI0eTSAN+nQ/KDsgSgnK44rXr4L6yJcQknkkIyW
         m960jy4ctjEcSjQ7pSu4K4G2AfHjA7Xrz4s1CcpPbq8WPfwOfKUoMTmp1en5RQRIELPZ
         DiqTpSw2f6w7yVwdW1BmAppuPpew1vA5lNtqlE9pY/cPWbcI4agnyEhM2kGdpZDYWzq4
         A9+Mi4mg3qsjuc7luFS1QnXDo9aM0kadQ9KNVYdRr5m/ZL+znYasYk5Ty7v0/isWCe4D
         xTArBBATk8CGLaoEWaNWkhjhAd/LfMKspoobS65IfKMMdo3gHImV8xvjJjoqbAdt9IfR
         6wZA==
X-Forwarded-Encrypted: i=1; AJvYcCXGA/t0TLXdX/hDJREqJnzB/zT7QD8m8RyrtoxHKdFc1F5B0XxZQVIBQ/hyfa1D196fBrHlFJF38yblrdCv2LfcHCOtB8Neg3uUgq3j/ds=
X-Gm-Message-State: AOJu0Yx4Xt4MijmvwFVy9dXyBJii7/ZozDIDdaQUTg7pwY4lZYjfA1/8
	Z612BekMenuTzQEQYmlJBHVCB/o/zExlTkN4q5aGgxSpdWBOSvapEaKTUan+018SIeSx9IE3wJy
	faKTOT+P8aCVlRfqN1CNhDNMwkjOJQb4M96bexreCXCIHT+JqfnHZvAJpqtx61k3bw5Nh0MQd+i
	81OfEFkdy5JB4L/CAboCdydhqyBrExhhS5E3hI2CI=
X-Received: by 2002:a05:6a21:99a5:b0:1af:acf6:f790 with SMTP id adf61e73a8af0-1b26f2c2bf1mr9959990637.48.1717378843703;
        Sun, 02 Jun 2024 18:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElrxzX3gcfL9k2c1+JBgHLwVdrPnj3FC7S/7h5Sf7MTBmkp9b5dcmtHZ/hqZZvLw+YRtcNMMdnU+NKkJobztk=
X-Received: by 2002:a05:6a21:99a5:b0:1af:acf6:f790 with SMTP id
 adf61e73a8af0-1b26f2c2bf1mr9959971637.48.1717378843220; Sun, 02 Jun 2024
 18:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com> <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
In-Reply-To: <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 3 Jun 2024 09:40:32 +0800
Message-ID: <CACGkMEthM=weSWrcsy035JLgOkhgpiudVANL-FAojki0Wr8dpw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:09=E2=80=AFPM Willem de Bruijn <willemb@google.c=
om> wrote:
>
> On Sun, May 26, 2024 at 11:26=E2=80=AFPM Jason Wang <jasowang@redhat.com>=
 wrote:
> >

[...]

>
> > I meant, virtio is not necessarily for a software implementation.
> > Various hardware vendors started to implement it as well.
> >
> > I wonder if hardware is as flexible as Linux to support general UDP
> > tunnel offload.
>
> Do you mean TSO with tunnels? Using software parser mode,

Is "software" here mean the driver?

> devices can
> support that. See also protocol independent segmentation offload
> (PISO, https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Prot=
ocol_Independent_Segmentation_Offload)
>

This is great, does the whole idea of core offloads has the plan to
release something like ABI (where virtio-net can just transport it).

Or virtio net needs to clarify such a mechanism with e.g CH/SP fully
in the spec, so there would be no worries about whether we need a
whitelist of the supported protocols etc.

But we may have other corner case where it can break the migration
compatibility due the limitation in the hardware resources:

1) maximum legal value of e.g piso_off
2) maximum #gso_segs support by the device

etc.

Thanks

