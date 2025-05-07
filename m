Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8F028E592
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746646830; cv=none; b=GDHeYX1o0nlyBDnc7GmbwSeEj7LfOdYI5emLKQWsgCAxsQj/C3vEICdZga4upD+71pl5Ars5VmEim3L1/ok1DFGBcJbETeRSY4WY94cL2Jz1Gek9qncwyJAy3qExU7Lcd/uiUcgt/LX+p7dQyewynWfsdNzUq/gBnTBW4ESNuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746646830; c=relaxed/simple;
	bh=H6FhZa0n2r7rtjp8vBYeaBUaFJG5VkOpyz/1c7WO06M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPHtJFId4vzC59B3It3mKR2PbrQ5FU4OTG25Td9risT7/jD12YGCrN/i79GREOHlB7HdiU0gFizY0gW22GRlelAHxjtQ3jrMw8ooEVvuH7K4oiMWvgpVDx2xU/x2fnbbu8fuFdmTEwaFOpUZcwpEYKhtezhJYJOc6080luHk6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MOfpvG0A; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MOfpvG0A"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af90510be2eso8927a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746646827; x=1747251627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6FhZa0n2r7rtjp8vBYeaBUaFJG5VkOpyz/1c7WO06M=;
        b=MOfpvG0AZiuJ/9jjP9mB5Ppz81xqVyMDM94AwkDdKvfylF+1cgqGAIDO50OnWVD54y
         GFw3wop/nY2w8yph1mDkoJ8juFd3q9/NN/IFmgAnn3riPFHCi6HROIA+VSFkdZS841HA
         DGpx1qMnPHYrjU1VP3k6A3m4jGr+LBEWEEaMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746646827; x=1747251627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6FhZa0n2r7rtjp8vBYeaBUaFJG5VkOpyz/1c7WO06M=;
        b=l4PS9IkHCRmg2K7DLm2eO6m5fA6m1VYKM2Ls83l37V7z+AmYClIO6ZUJIQ9BKB3gnB
         GdIS4zf7MJRxQm2FsazEAP6SoSLVsqd3I5xC+bkiYbzaIpsdJOLLfYr1d1tG1qxfUXy5
         eapL6uWne5qbdDg0Ksh4EBSf7QsHtsapnPftMMgx+zw3/R9RRje//Tx7iZrlJVlIYees
         7/MtuUePJAMsyZvVNUte81LXYXMG857mwYe/FOKZ90z43uvAK5kJp6uiyC593YUIGhjJ
         nnXBLYjOUDHdYvb++MpUEowygLPkg9m5krEozsHlMPba3jx9BwvQcxG7TB/x2lMb46v9
         TwvA==
X-Gm-Message-State: AOJu0YxrSf6oh2GOeYQWagP0U/OjoxhDPjFqTRzQtQV/01WvOqdh+DTG
	rLXopRB0MLwzUor8atmUFD5BD795mkD8O+nAQyKXmq3PRgvs5UqMe49ndyqRzuq6Y73skzC0buU
	=
X-Gm-Gg: ASbGncsfSeOE9q3AR9BbdVuNy5t4jCbr2Oyb8dlWXXKGp7ticvGa5kwM2OVfcJV4ZN0
	24ZRyPReg4FlgXTDtL3pYCvUpS2JVr1eY3Bxjxo2v7r91Dk00jJVZ7XpMMItZPGnwq7NaJYNaWX
	mjxTmbh0f8c7QHhg9YLa9nBQCi60dYpC3Jk6UAaVWrDyW93rfKXk/Y7voc/BcFPOmdVeD/oQZZp
	A8vifcTxKDxAMoinrk3Znaw0HUDIsl12eQfXktRZ0NjyVHHk2bca4WK5gGbTvxPu/thHgzSxeSx
	WD+JuPzU/JDU+ppbjKhXgjNgFEHL5uIwjQTD4k68s3n7aJSfIhIcCRNfXo4GPGU+w0kbcmmFCza
	uZIKGiIaN
X-Google-Smtp-Source: AGHT+IFTg0jg9B06T35AUb4uAyeLQ5JUkTWU9f82aIQiyLUmG+I0s6K3tYvSjaIULNPbIoAGD67i/g==
X-Received: by 2002:a17:90b:1d92:b0:2ff:7970:d2bd with SMTP id 98e67ed59e1d1-30aac21f536mr2767766a91.5.1746646827512;
        Wed, 07 May 2025 12:40:27 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e696a554esm17590275ad.128.2025.05.07.12.40.26
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 12:40:26 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a7e126c7so298088b3a.3
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 12:40:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:308:7a70:489a with SMTP id
 98e67ed59e1d1-30aac246b98mr6949585a91.30.1746646826205; Wed, 07 May 2025
 12:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507152602.3993258-1-afaria@redhat.com>
In-Reply-To: <20250507152602.3993258-1-afaria@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Wed, 7 May 2025 12:40:00 -0700
X-Gmail-Original-Message-ID: <CABVzXAmC_J2CT3PGqqf_t=jO1TZHg4PjX4=AyYbLPa=JK4eP0w@mail.gmail.com>
X-Gm-Features: ATxdqUGV3e1UfIqXWs0OZLwbI9_ESu79ZoP-3SNtVHGoSbkBWqxNXVyjPv6m7KQ
Message-ID: <CABVzXAmC_J2CT3PGqqf_t=jO1TZHg4PjX4=AyYbLPa=JK4eP0w@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
To: Alberto Faria <afaria@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:30=E2=80=AFAM Alberto Faria <afaria@redhat.com> wr=
ote:
>
> This is a variant of the VIRTIO_BLK_T_OUT request type that further
> ensures the write becomes stable once the request completes, commonly
> known as a Force Unit Access (FUA) request.
>
> Also add a VIRTIO_BLK_F_OUT_FUA feature bit signaling support for this
> request type.

How does this interact with the writeback field? Presumably the value
of writeback is ignored by FUA commands, but it would be good to make
that explicit.

Also, the device requirements "write is considered volatile when it is
submitted"/"write becomes stable" section seems like it should be
updated to include FUA requests.

[...]
>
> +Drivers SHOULD NOT negotiate VIRTIO_BLK_F_OUT_FUA if they are incapable =
of
> +sending VIRTIO_BLK_T_OUT_FUA commands.

What harm would be caused if a driver accepts the FUA feature bit but
never sends a FUA command?

Thanks,
-- Daniel
