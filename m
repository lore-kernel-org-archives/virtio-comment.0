Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A0336D9F8
	for <virtio-comment@lists.linux.dev>; Mon, 11 May 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522815; cv=none; b=ltxPjZWuOsMq5sj8KtbHu5pEa1SKyQh9YUBgtWcw8dFvkPa1lmkw3xh8LUfmEMAueu48hFBtoDxVTQY2xhhmymnKDVMUfdmeBip3HQnIAMvl08H3jjtsIBra00+g472Co1cmbRE6j0eZurNZdgwftEb2ugCCaPcN+g+ImF6yQXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522815; c=relaxed/simple;
	bh=61oYivo+b06KCRKdraQ1ettfVRuc5Tvz91MafVFdZ7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvOihY01znhSIwtWfb6If+yN4hK/zTwuue/Ku4UbJg1Ayf6LYgNEKujzE1OpaPPpxKjsq3cgP6B2qhuIbZqk27etb6IpoqoLaRvelNKYwt0xbGYy3H9Y2VO5JFEd+1HRvjLx9SXSy/Mf6+5dDGgIEDC7O63OKfpLTm8Y0/PDjsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPVHXuuj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPVHXuuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778522813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61oYivo+b06KCRKdraQ1ettfVRuc5Tvz91MafVFdZ7M=;
	b=bPVHXuujKdWWvAPGy4RH69wYdshJMd+rQub6IHEKRpO3ePfyQiTW210mfJa564+XK7Z2bb
	DzLqJXy6zC4YkCvuufntJSosV5QeUiN0ePQYEMYUaek02Ym2vDgGSTkNuTq4S05fGEpfDK
	uFyspkKVOlx3UbcSqI9J7OeD6pxeR5U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-TBIuw5uRNKes_JX5hW82Qw-1; Mon, 11 May 2026 14:06:51 -0400
X-MC-Unique: TBIuw5uRNKes_JX5hW82Qw-1
X-Mimecast-MFC-AGG-ID: TBIuw5uRNKes_JX5hW82Qw_1778522810
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-67b88d32946so3129317a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 11 May 2026 11:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778522810; x=1779127610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61oYivo+b06KCRKdraQ1ettfVRuc5Tvz91MafVFdZ7M=;
        b=WO+k5qECiETJCrlRhqWsg/CdLeLL6RRzVvL+lCOdJpL83I8nf12krceu/qIrSNb7Ak
         w7LxoAsNMYFiWg/H+aKR8SZuoHTXOlko2t0MoBD7GEn3FHB9FDd94eiBlO+gFeEvmRMS
         jGmMRs5aHU7pa5UhS1KaMAmAR8F9495a5Dt6ioMzXMF+ztnsH6NXE+/7/WcY4OYWGbS0
         iko6ABq4cKl3LAUTuXZ7EbyGs/YIflaSkzuA3fOSKE9m9Pr750ka3PmYzl6Ao0sBW+i5
         2hfFU7iaqGkLPrOXQ8RUgFNraUyRm3KwnjCmNrcf4+iafxrFniuS4uNgF1wCJ7WkxiOd
         5k8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ga0U+SVyZKpSYhTDtTqtwPewe/++LvBhfO1In8oBXE3cvR2sa5AoARZnCw6sxQfVp5o1LkZVJGtc98A3jfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6iRgdGu1/8ZTINKZPk+y9BrEtD7hIiw3cACRLpcEvWP/UzKPZ
	wF6c51Ipwzr6OXffM4bNVGUXhAcMM8058KdTOk3OaKZWhSotfso0euO2/h7djvq25q+PLiEpJqP
	zowQYPFN6YFyjU7zGGzafmK+qMyfOW6UgKH+d1nbooiWrE4MWWcCyWyRENQfEByd8lYGyrIPLU7
	6gHt+kqycIZTP41TgKB6jeKeQRnl4Bl9I6NqSgDKo+p2w=
X-Gm-Gg: Acq92OFkPlUvznEI88H2p9Z9eIMKoBXLDkBEWC/bjiPH1Ke4LRwLScxEtCqyVYe9/ac
	haLmPnXNEEtG48k+i9FGR3vd9JuIfG5rBKTszHH7CM3r51hYMoI2BjrZTwe7kzM6CmVS7QXGv3I
	PjfUQdpePJyNA51rkUBwloRN5R/Q79FRA/xMQZ5YsXSjsx4cw8N98S1r9QAfJMWWLnKOQri5oPR
	FFguaS5x8+GjYo4y2GvtGpvqF46ZfY/cOPC7g==
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id a640c23a62f3a-bc56c92bfc1mr1514457866b.16.1778522810124;
        Mon, 11 May 2026 11:06:50 -0700 (PDT)
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id
 a640c23a62f3a-bc56c92bfc1mr1514455866b.16.1778522809635; Mon, 11 May 2026
 11:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAELaAXxJy7vyjq+zegKzGL_W24GC_k0cRmVnqLCuiFmVtXpL1Q@mail.gmail.com>
 <20260511134832.503803-1-stefanha@gmail.com> <20260511174859.GB536999@fedora>
In-Reply-To: <20260511174859.GB536999@fedora>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Mon, 11 May 2026 20:06:38 +0200
X-Gm-Features: AVHnY4K5i_3GbdcRcqJ2Bxuhjij6kzBMftRuBFitJs3OTpvImbR2JqtSOtRGTHE
Message-ID: <CAHYGQ0ybxykTyQrLYBB-TNYkEu2Zd8xP+4F1Ggt0g+RB1xipgA@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-blk: Add support for "Force Unit Access" writes
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: mst@redhat.com, afaria@redhat.com, dverkamp@chromium.org, 
	virtio-comment@lists.linux.dev, sansshar@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ofWWsb-Bvl_prtfhLRKtu-Tz92yAhkERDKWbPT8jJMc_1778522810
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 7:55=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Mon, May 11, 2026 at 09:48:32AM -0400, Stefan Hajnoczi wrote:
> [Resent from my virtio-comment list subscriber email address]
>
> Hi Michael,
> I don't think this issue was ever voted on?
>
> I have verified that the spec patch still applies cleanly to the master b=
ranch.
>
> Please begin the vote.
>

Apologies for the delay, I just created the ballot.

Matias

