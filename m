Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7B176246
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871169; cv=none; b=ET8a+bL7OMv64eS8eGM1k0JsfYohMyeqwBrOa6HD51+rGlffSbHoigICDSPbnzUrhYbGOyKMS2A5CPmgh78yoOTkV8ZfNbFIqjNOFNNdlC5umNwBRz0KcAaPt9LrKWnyoZEIx8fCkh4LQjz09sWPqc2yUBXQ9mmYeT78eSvYjb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871169; c=relaxed/simple;
	bh=2R8ky8qw4aiiUu6QPmL/99Eq3l1/8BU47/yfUekKoQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKyFD1dsuuDvZZUhUBGmwaZhr7QET7vWHr1sQ72k6aEwl5cn3DoWEDobEC2SxQg4/fw2vKn3PyLtdvftPvlf9wXQjGp32JvAbA5rSKjcKXszEOpvpudjEUW3IJQkB0dgvYEinGgMJA47CfVmdW1L1dkR7dnuX053M9UahuilKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWdYhlbw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWdYhlbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725871166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2R8ky8qw4aiiUu6QPmL/99Eq3l1/8BU47/yfUekKoQQ=;
	b=TWdYhlbwGtUOGb9sFaJgnbBMmBaL/UDdTiRj+iYi6fk+6yIgubvYP96yiSn8uX8Dx0JHqY
	7irSSRgjJXuYRdKT5ZVU2MN8UNzJjB2aek2bvazn52qlAIc92GE8DJCdUTrAw9P/rqRdJ/
	xSapv+oo3V73VO5dYhkuB4diBfMUhDI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-lsW9Zh55OL64S9uG_wSIjQ-1; Mon, 09 Sep 2024 04:39:25 -0400
X-MC-Unique: lsW9Zh55OL64S9uG_wSIjQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d8b4a23230so4408894a91.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871164; x=1726475964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2R8ky8qw4aiiUu6QPmL/99Eq3l1/8BU47/yfUekKoQQ=;
        b=nBkn51OFnQVubAaB5HgPHY+l1Cd9b9t6Uci7StPq/kPQtQBIhkOIPQNtH762OLIL7m
         /DdHsOBPcGBC7R7U2j0TXTCPlyNZ1z8VNzh3/FpK3r4cKhFfRrJfYQgcGk133Ccp7oVG
         cWe2xrOpWO3spHV/84+5XbHD2gAXoagC7KNAxdt88KbPOvzvfF73xJUqc0BUQeyC3Xq3
         fRQXU9/FvfqepxJQQMYuMZO4I/CXawpy8eZB+4njvVicy280mPrjeOGzuJ1wxxJMOsuM
         QOZk2rnnGOitje9ZkutREcDyvDkqv7wqxZUJj2CwN4iCQ8pkBWM2k+WWmeYfxVspWlvA
         8NxA==
X-Gm-Message-State: AOJu0YxZHgHOnynsdzriEUPms1kc94r07dgYIznS+UhQB6PBxP2Tf9GF
	Pm40vy8I5cPBffJaEYGdo/RWx+qBiZ2ENCon7Zfz1x73wToTL15IcWhZ+2aciWqv58Y3VaZPVGW
	iLc9BXHo1GQxEdELSnK3fd/0AFmoqrOF201PiXiNs6EdaTWSnevgGqWHERduIriF4DSUIg1Ya+i
	SiFIR4JhGvb3qJfgKPyuc6uqoi3NbmddN+C77HBac=
X-Received: by 2002:a17:90b:3cd0:b0:2d8:e524:797b with SMTP id 98e67ed59e1d1-2daffa7e131mr8573769a91.18.1725871164056;
        Mon, 09 Sep 2024 01:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0q99UdsVAlk8HrkbCqT668Gq91wwjxoHDPg7HBlOhZihyeIxBJVIuldyS+8PGBiLlhCT6wq6cUBX0ZxdLJTI=
X-Received: by 2002:a17:90b:3cd0:b0:2d8:e524:797b with SMTP id
 98e67ed59e1d1-2daffa7e131mr8573746a91.18.1725871163634; Mon, 09 Sep 2024
 01:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com> <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
In-Reply-To: <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Sep 2024 16:39:12 +0800
Message-ID: <CACGkMEtb6M7uHUOjRiNoB=PHLvBecPa2YdMCXzVkggimer=nrw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 4:05=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
>
>
> On 9/9/24 05:16, Jason Wang wrote:
> > On Wed, Sep 4, 2024 at 11:50=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> UDP tunnel usage is ubiquitous in container deployment, and the abilit=
y
> >> to offload UDP encapsulated GSO traffic impacts greatly the performanc=
es
> >> and the CPU utilization of such use cases.
> >>
> >> This series introduces separate features to handle both UDP tunnel
> >> segmentation offload (patch 1) and UDP tunnel outer checksum offload
> >> (patch 2).
> >
> > Looks good to me.
> >
> > And I wonder if there's a link to the prototype code so I can have a
> > double check.
>
> I still have to refresh the code from first implementation - that was
> the base for the first draft here some time ago.
>
> In the next 2 weeks I'll be traveling and/or AFK, I hope I can share the
> code a little after that.

That's fine.

Thanks

>
> Cheers,
>
> Paolo
>

