Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5128C85F
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650920; cv=none; b=hWYDnUHeMMZwshvPr+ITK7k19al+zFiiIPKVkOQlfzPwwHzdewT3HZXOnr/hqiWn74+LQlj3hpvTy3Fg7Xl3whYnSkT87BAs9m1fnULHHuMCbyOLIcfGOefZIHktRVfnIzrZgs9lK69ApIdbppmqUB0pTWeoDDnIjZrtCGrkbuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650920; c=relaxed/simple;
	bh=bG0xKa+1y6cP6ZIGoi58WdN6URnLhEBSKWJBfkpsCuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f//wSnPiQDwXnTXT980kRghVcPdFpdHNVgMGk4qsmv5oYMNJeLyWQb2DXq9UgmfIFhvjtZPK7gbZX6oOwwctYct27gg1xb7afV967bs3PuG9Ls/bP3QoMz8LjFySuZG+YGvB0XhTDqFdukp5H5iB2+aq+tr+JydHRIsEiCoD/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR7o9o8f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR7o9o8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746650917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5wRRNTDqZriN0UXrQW2kMqH3npbQyRQJZjn93cxYNM=;
	b=iR7o9o8fIubBXbrMvJKGOvH6eRUoObMFSjbTDVHM+2Ls67czAq2HLaf/l1rDfQYdidYigC
	wbSYjIeTwPNyzoO/LAtjHFVgJn15/Ekf4bfmXZVJa/65pZ5FofI8VfohVqpkpTzu/ScfG3
	jKo7BhBa4nCZ49dB1liBGuJhM337qLA=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-fPkvPj3-NCKXftNtKV2HTw-1; Wed, 07 May 2025 16:48:36 -0400
X-MC-Unique: fPkvPj3-NCKXftNtKV2HTw-1
X-Mimecast-MFC-AGG-ID: fPkvPj3-NCKXftNtKV2HTw_1746650915
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6062344f560so253599eaf.3
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 13:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650915; x=1747255715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5wRRNTDqZriN0UXrQW2kMqH3npbQyRQJZjn93cxYNM=;
        b=PS99y1lscaWPCB5QxdbLxZRWoA7owVb5GG3MndoS9C6Hld/JA6gmdebw8k6qXwvjNF
         e/Jcg+Je9vUORXt1AbFKDynbcrpuf0vDTcr1Dflqsyunpcu/K8JeaA1NZn0tABU2HpjV
         u76ePZonSwi4z19BT7JIQxDpiGib0728yTUZIx+HLe9AHytbzYXSCEshLFKYKKHqQN3z
         z1oO97wwSowVtXuk5+ptG3q5A/SIPN05W6Nx0DAQ8UEWZMn5occidzBazDL5lwqHLeXq
         zM/i0D4VR3Wr5fdh+NBymooIrXKZgYOgx2WKApcu+0rWyLuONXIUBpht3pGlNNhlYxqD
         zxLA==
X-Gm-Message-State: AOJu0Yxj94zepjltZ25Er9lAfKIpK/ac8GWr0YaQe8xJAGuc79q18HZI
	sRWiR6QYqOjQ13ncgIwkH1ilizeg/50HlgF1WDtNiaO0xZoZs8e4uwyREELsV3u1lK4JB1vhPI5
	k8OwkX8qcTlqGZQF8+A8EasfmeOIR7WC19orSELTVN8CaZmgbYrZftvJq6qtpgFzzDvuQhc1dMY
	siRmNOqT8hdME6B3HFXe8+UwRiR2BUtUfcW30Z8uE=
X-Gm-Gg: ASbGncsbBAMvqATdt2u+Ib6cZOkHMXmVIMvwrGOBlnHm63JhHe8MdPn8ZZNGIVynkdl
	2yOGwWWAje/CLLbDG/d5cgQs2hdeFco83+sIuwCPiSYeRSGmArLm8oGRX5dqPFsfvSElBmQ==
X-Received: by 2002:a05:6870:898a:b0:297:24ad:402f with SMTP id 586e51a60fabf-2db5be304cdmr2742913fac.12.1746650915491;
        Wed, 07 May 2025 13:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQvWNLNKsUSc5lMUAnlzY93BxHEIHMXJ7Q/TrN2Jz/u1SOaGmtJCU3kRTbwdMhDx9ank2fzTZAus4lfWY6D4I=
X-Received: by 2002:a05:6870:898a:b0:297:24ad:402f with SMTP id
 586e51a60fabf-2db5be304cdmr2742905fac.12.1746650915156; Wed, 07 May 2025
 13:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507152602.3993258-1-afaria@redhat.com> <CABVzXAmC_J2CT3PGqqf_t=jO1TZHg4PjX4=AyYbLPa=JK4eP0w@mail.gmail.com>
In-Reply-To: <CABVzXAmC_J2CT3PGqqf_t=jO1TZHg4PjX4=AyYbLPa=JK4eP0w@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 7 May 2025 21:47:58 +0100
X-Gm-Features: ATxdqUHSIa6XCyKoLQZrWe95-m067u5c2cnZJ4MYq_To3nncZV9eEREp6DUiTso
Message-ID: <CAELaAXyD9EEu2p0W1U8=QCRj1G++E5Kzpc4__u=M=VKDPVpnZA@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sx-k5EX_TYdzSzOezq450m3z--PsKoIgdP_aDJ5ajBc_1746650915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:40=E2=80=AFPM Daniel Verkamp <dverkamp@chromium.or=
g> wrote:
> On Wed, May 7, 2025 at 8:30=E2=80=AFAM Alberto Faria <afaria@redhat.com> =
wrote:
> >
> > This is a variant of the VIRTIO_BLK_T_OUT request type that further
> > ensures the write becomes stable once the request completes, commonly
> > known as a Force Unit Access (FUA) request.
> >
> > Also add a VIRTIO_BLK_F_OUT_FUA feature bit signaling support for this
> > request type.
>
> How does this interact with the writeback field? Presumably the value
> of writeback is ignored by FUA commands, but it would be good to make
> that explicit.

That was the intention, yes. I'll make it explicit.

> Also, the device requirements "write is considered volatile when it is
> submitted"/"write becomes stable" section seems like it should be
> updated to include FUA requests.

I added a fourth item to the list that follows those words:

    +\item\label{item:flush4} the write was performed using a
VIRTIO_BLK_T_OUT_FUA
    +  request.

That felt the cleanest to me.

> [...]
> >
> > +Drivers SHOULD NOT negotiate VIRTIO_BLK_F_OUT_FUA if they are incapabl=
e of
> > +sending VIRTIO_BLK_T_OUT_FUA commands.
>
> What harm would be caused if a driver accepts the FUA feature bit but
> never sends a FUA command?

There's a similar sentence for VIRTIO_BLK_F_FLUSH, so I followed the
precedent, but I don't think there's any need for it for FUA. I'll
drop it.

Thanks,
Alberto

> Thanks,
> -- Daniel
>

