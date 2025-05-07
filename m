Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878EE22F17B
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654139; cv=none; b=Oqc3q2Nd1bji4lhVOMZlZxCBwPDws6uYKtC7QjLzCo37HR9VlkIIVtsc9JT8k5hp1lYRGYI0CcVCvAQMkhgDoKGPq63cEbcXcKTBvDK9nJCXiMKJbPDNHgOKC43gv+pOglq/qbTIjrV1e/tFLNCqWa9tbP4e+SsK5J7O+p0zZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654139; c=relaxed/simple;
	bh=Ic5lkCmUX50q5Bq6zk4Ofln/wGfcxzgK3DVr5fHCCgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBQmk8i3C/tulMzT6/0kI9qENv0PboN+jES5fc6BBO+/wbv50ws74ZiQII8MuNNbtopD8IQ15gGhi5OaZA2+CMXGbHqQ2XrNIjY6ZbJxg35oxPLqGjTxAfNPeAN9/22DnKUDT6wUCHzVmSxotn7Ys09fyQA+62mIPXJJazdvV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jzw5qBZ5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jzw5qBZ5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30ab2041731so39656a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 14:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746654134; x=1747258934; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnXWf9rFXH595Z56v1TcpbBnvcruegHNMGhI+tHQMT8=;
        b=Jzw5qBZ5vxIvtR883QFUsWnJ9/UdTLQyViwe774F2aUpiMBKGMD8CIk0l8aAc7wbUL
         WI1EFiG42bw5RXD85ivyBQirVLNVbxmzm0h5VWDl3dfPd70ryzhYAS8Bh6FYWLGDIFgS
         pr05T68D2RFqemeM3FujlTOYkY2b59cssIDFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746654134; x=1747258934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnXWf9rFXH595Z56v1TcpbBnvcruegHNMGhI+tHQMT8=;
        b=vGsQ3nBYCs4/0xCr+M5AjQKIg+dlu4r50+0T3DAiZt+IQAoQcMmA7EBoViQAHuu+i5
         gpkpTCoMmCHyt83rwZcPwqE6K6bVaHT9oB1hXhiYTqgC0n57GrNo6zl/PnV/ob7rcDMC
         KSL8mv7h1aMF4YKWFsivPX6JRM+Ttoe0np5ztwl3mOayEW7qYOQcWHCT/bJapwMPKKz6
         PTFeWplrRebc7/Qsz2VO3whzWucVmTyRyZrazSok0e6KaCpXDmUzCI27tVTAmDCuxiSi
         TIaIoxR+q3ogtUvlEuJZotsxcCI1Mj1cRpPtukGWQIbGbNO+eDb7lY6WcbqxKoJEVEp0
         XClQ==
X-Gm-Message-State: AOJu0Yy04fkrP61J7yepGu2vvfJ0dkZFS4ZVN6R/Biotwfnq+4te3On3
	+UHUkWH7CffmpRHrFRwNM7c0yoA3yn0wkV4jRtkEQMckEKOW8xLkdVvi3CR4eb5ifLGIBWHj598
	=
X-Gm-Gg: ASbGncvYhcNZ1Uy1WsR0WKbBWKhIx4ap7XWCgG1KMVA1xnTiBPku5XEF8pSn9AGz90I
	RP+4Up15DM91zRDtY15v9zbHvW+RUYXWgE8G/Dj3ZWdwHQU1QcJH5XqkAZYHdgUYyE6tP9P9tPn
	uVtE7gEU2TgJ78JtAFhnhHG1Mmbe8s1xHvHT0U6SKNo7ygaJWveZA6aZpJKPUmuqwCOoBaJUqTm
	ViNZq11MwZjsXRPcGvGyKeqwoS4/63jKCXVWI8VtBUpgMTvDl3MB0P4DkMeqK/xsIHy1UeqZAJq
	b1WZCnJAALx+VX13+PIRp7/zcEjze83pjeF9+hGfxEvazF/9yawY/kmQkHil4yUn2WXCzoLZAjR
	2X6z2cr6d
X-Google-Smtp-Source: AGHT+IHMiVo2rIl+OV7Myz5FUrk/hGIWz4t8LM66KzHZzK5tLy79wM4b+M5mAVXFwy3Ccuc70rEvpA==
X-Received: by 2002:a17:90b:17cd:b0:30a:9935:be98 with SMTP id 98e67ed59e1d1-30aac210cb0mr2750020a91.4.1746654134472;
        Wed, 07 May 2025 14:42:14 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb42fsm795982a91.40.2025.05.07.14.42.14
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:42:14 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so228041a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 14:42:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3e83:b0:2fe:b8b9:5aa6 with SMTP id
 98e67ed59e1d1-30aac25538dmr6851140a91.31.1746654133501; Wed, 07 May 2025
 14:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507152602.3993258-1-afaria@redhat.com> <CABVzXAmC_J2CT3PGqqf_t=jO1TZHg4PjX4=AyYbLPa=JK4eP0w@mail.gmail.com>
 <CAELaAXyD9EEu2p0W1U8=QCRj1G++E5Kzpc4__u=M=VKDPVpnZA@mail.gmail.com>
In-Reply-To: <CAELaAXyD9EEu2p0W1U8=QCRj1G++E5Kzpc4__u=M=VKDPVpnZA@mail.gmail.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Wed, 7 May 2025 14:41:46 -0700
X-Gmail-Original-Message-ID: <CABVzXA=yMzhgRESyhaO63kDossavtUHh8ai3zaU90d93in_5TA@mail.gmail.com>
X-Gm-Features: ATxdqUEDZkqLFV8ooJu9w6V48li-TOgsePEPeb9X4tKQxAusHec_tKJfLvdSCOo
Message-ID: <CABVzXA=yMzhgRESyhaO63kDossavtUHh8ai3zaU90d93in_5TA@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
To: Alberto Faria <afaria@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 1:48=E2=80=AFPM Alberto Faria <afaria@redhat.com> wr=
ote:
>
> On Wed, May 7, 2025 at 8:40=E2=80=AFPM Daniel Verkamp <dverkamp@chromium.=
org> wrote:
> > On Wed, May 7, 2025 at 8:30=E2=80=AFAM Alberto Faria <afaria@redhat.com=
> wrote:
> > >
> > > This is a variant of the VIRTIO_BLK_T_OUT request type that further
> > > ensures the write becomes stable once the request completes, commonly
> > > known as a Force Unit Access (FUA) request.
> > >
> > > Also add a VIRTIO_BLK_F_OUT_FUA feature bit signaling support for thi=
s
> > > request type.
> >
> > How does this interact with the writeback field? Presumably the value
> > of writeback is ignored by FUA commands, but it would be good to make
> > that explicit.
>
> That was the intention, yes. I'll make it explicit.
>
> > Also, the device requirements "write is considered volatile when it is
> > submitted"/"write becomes stable" section seems like it should be
> > updated to include FUA requests.
>
> I added a fourth item to the list that follows those words:
>
>     +\item\label{item:flush4} the write was performed using a
> VIRTIO_BLK_T_OUT_FUA
>     +  request.
>
> That felt the cleanest to me.

Oh, sorry, I missed that this was already included in the original
patch since the context wasn't clear from the diff. This part looks
fine to me, thanks.
