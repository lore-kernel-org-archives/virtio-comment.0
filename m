Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CE2066E2
	for <virtio-comment@lists.linux.dev>; Wed, 12 Feb 2025 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371180; cv=none; b=NUOh1nLU/h7546ZoKP3N9Lh0ePKbyVW3nKkrf/hFiexyvgUFRNCUS6pRG/f4rTJr4S1btNlvXf51rTEUV+RaVpF5Je+NEWkzimJ3F2aA9rYDhK06rxQudyrZdMzJHtfPtx31P427TpXjux6wymqSSEjKWu+Qen9RkLCm/37z4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371180; c=relaxed/simple;
	bh=uYPTGmIBRGY5TskATwtQzilydmzP1RumoMR2MUDjJuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uw+I3ThfMt1UU9PwVgvvha2eyYhjtwgKEdhiFTIJ2f0A2CSYiaeKVtZKMo25fn4qaj0CE3ju/q5aUoW8fZr56ES4BCquSK/fATO5AKXIM8yIA1/9beCcZ1u4P/5tjdC6VxNl3QrYfDH9ENVSW9yVnUQSTVcTyZ2uD+Eb35abPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhCgxWRz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhCgxWRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739371177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZ6h0mpKMGFhMY5SYbho0Xzpj+K49NRmw4vWowPx6SU=;
	b=bhCgxWRz3IVn6m945jXFtIjGnPMdRN+ggb48CXoZvPgEVit9J8wOCC3lNFs+mfJq0bgSBo
	4DzOlRb398HexvnU4o1J67h1i1P+hS9J6WCyCdfDU+gnyLWH13/G9D8LtEcx+9qqESOgOc
	OYAlppdOHDHra6/q6TeRoXh+lR+JRdA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-cfJlu6jLN9q8DCf-Z_2Y4w-1; Wed, 12 Feb 2025 09:39:36 -0500
X-MC-Unique: cfJlu6jLN9q8DCf-Z_2Y4w-1
X-Mimecast-MFC-AGG-ID: cfJlu6jLN9q8DCf-Z_2Y4w_1739371175
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d90a59999aso7790132a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 12 Feb 2025 06:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739371175; x=1739975975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ6h0mpKMGFhMY5SYbho0Xzpj+K49NRmw4vWowPx6SU=;
        b=fODYJb5G90GWdx7T5WrhEerp6QzBV7H7q8U6KieO2//1FRPd9v1YsBUUH458DGsw1O
         5+PmPMloyqi5eobOFvgK6oy2kmFiOKko9VHMaWpLfBe4fLbsCxvLqkUZuoT3aYLoV7AQ
         hp/J1JEhmKV2XL+0JxylEoIwBizAzR3Vtl8lLeiLwoEJcBeU7MAy6PJ3HF8EYKa7iGh0
         78C20yT3tMs+ytXrRVwURKDqLHYmvdaXuLOx/VgGM2FPPpaNOSQWv9kUlPX4WH4FTepQ
         9szSCVToyzLmzAT21ulC3t5YJvetfpxKj3iOEE+B+k4DJFoJztoX31B4CEK+E6PWeIJP
         eAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXo5O2NlQGUfr6yG7r/UCUnpIanfcEKqoqD0TR9ktw9FuwU7zT/eIvGcsnA5jeDmKWHSDE3rhALTNeXn+c1UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3cRXBtx7weH28+UxEQov2+x6dB/mYPBOaAiLhk8KvYUr69sS+
	mI/hu31hZALfjBk+jyY6SwYJkQuDYTsx+JIat5dXXWJCfLhWYVvo01AKVEey/f3P9ca9+DrFv6Q
	18tEfHU8JTmhONVX2gEXu5wpG9zpTTW7ih9TNcWJg1WTZcEuyyLV3wntx7RoJ+3j5
X-Gm-Gg: ASbGncu2C+e04iSR1LnJ1rN9S7UWSzTprTyAhMgSnH0zxnRPGEJXleLYheTQONyujME
	wfny/UHg0ghQkuBIe4l9Gbszr5OlHNwQ2WQQglfjqTDM9fB9J1/Tij1afzwtR1AK88inAfCGKsy
	E2iJjYz9cTvR8Qx6ULeP3f2q9m6aoKGdlr2SVdQ7avgH+2fi9dJMbLIC9NIPROT9JMGgQ4XHdLU
	fSsl95mhNXvE3NAAXvIos34ihTjyvKvANlI4VF3R4YbZv5o3s9BR+qljCLRXLRwvEczOA==
X-Received: by 2002:a05:6402:354e:b0:5dc:c9ce:b022 with SMTP id 4fb4d7f45d1cf-5deadd8e4bamr3179706a12.9.1739371175047;
        Wed, 12 Feb 2025 06:39:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSz0azkyW43YwGPruj98uVjzCEcY2aiTyEN3Z+gHO+dFcy3we1C7hlVlQIQv56DW4pCKPuuQ==
X-Received: by 2002:a05:6402:354e:b0:5dc:c9ce:b022 with SMTP id 4fb4d7f45d1cf-5deadd8e4bamr3179686a12.9.1739371174688;
        Wed, 12 Feb 2025 06:39:34 -0800 (PST)
Received: from redhat.com ([2.55.187.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4476d076sm10871715a12.2.2025.02.12.06.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:39:33 -0800 (PST)
Date: Wed, 12 Feb 2025 09:39:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev, eballetb@redhat.com,
	adelva@google.com, gnurou@gmail.com, cohuck@redhat.com,
	daniel.almeida@collabora.com, ribalda@google.com,
	dverkamp@chromium.org, agordeev@qti.qualcomm.com,
	alex.bennee@linaro.org, nicolas.dufresne@collabora.com,
	gurchetansingh@google.com, changyeon@google.com, hverkuil@xs4all.nl
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <20250212093918-mutt-send-email-mst@kernel.org>
References: <20250205153301.133040-1-aesteve@redhat.com>
 <20250205153301.133040-2-aesteve@redhat.com>
 <Z6nwDxbNZ6ZAPbGQ@fedora>
 <CADSE00LCgziXZmHs=X60AY6cBnWOEOR8Kyh1AFTFg=b7AHuMqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00LCgziXZmHs=X60AY6cBnWOEOR8Kyh1AFTFg=b7AHuMqA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZSGhY4-jJJ2h2ZgKTs9qW6YnCaS-nUe6YyPDrRTbR3A_1739371175
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 11, 2025 at 10:15:13AM +0100, Albert Esteve wrote:
> On Mon, Feb 10, 2025 at 1:24 PM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > On Wed, Feb 05, 2025 at 04:33:01PM +0100, Albert Esteve wrote:
> > > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > virtio, able to virtualize any video device supported
> > > by V4L2.
> > >
> > > Note that virtio-media does not require the use of a
> > > V4L2 device driver on the host or guest side -
> > > V4L2 is only used as a host-guest protocol,
> > > and both sides are free to convert it from/to any
> > > model that they wish to use.
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  conformance.tex                           |  13 +-
> > >  content.tex                               |   1 +
> > >  device-types/media/description.tex        | 617 ++++++++++++++++++++++
> > >  device-types/media/device-conformance.tex |  12 +
> > >  device-types/media/driver-conformance.tex |  10 +
> > >  5 files changed, 649 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >
> 
> Thanks a lot Matias for your patience and dedication.
> 
> I may wait a few days before trying to move this forward. Either way,
> now I'd need to follow the normal procedure, open a issue and ask for
> a vote here for integration, right?
> 
> BR,
> Albert

right

