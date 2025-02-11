Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9F1C9EAA
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274847; cv=none; b=S4Q487RroUgSKtX/F75+q5Va2GpVMwlzM8dOPNaKvwBCY3bJRCLlHd8+vwIDXTWFoL2fXlO7g6x2GoznMLMqCKykBVkEmvnJ3FvKrgy5HADyCzHVr8QjVZJp6PDuTxBo80xTr5IFrlOkzuQdQFIpKvdreSnAHiTxjUgiBRzYfEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274847; c=relaxed/simple;
	bh=1Mcc5gQl3QOR9y01O1iKG/A93xbcsg5mVnUp2A3g5xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jM2ypNwqJi8LANUwVNZUvBmAlEpZaBlXuOrOzGHtN2D09vDUfA9V2zl1AKTLlZ//QZo4yCFHtwZ5CLc9ls/j3tlkkHdJ6mCAc7eeDw+retVLCthjbY1qOkNSFayQ3BVj6GguilF3dB4xvdnyo3BUFJVSiZkg3BLm5OzyjU4ar+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MS81/B7j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MS81/B7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739274844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eBR1cGhrch6zxsjzkpgbtFU9OkZvzLf57IFsBLFTIrY=;
	b=MS81/B7j+wrpQJhQCpKcaagAFDD+lzYLn1tfh0c0+enlhJ/I+woLXfHcn6sLYzzUOdzthh
	prrOv0JL7QToPW7dt3xjmnxDCP99R/X70vc/1oPpowSBNMin22+PN8aNjADSpm35sh0a/I
	LlyAYaAqDE2zIv3exJNRq79nTRSmujs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ZDJZT8w2OxKTgLFytJlOEg-1; Tue, 11 Feb 2025 06:54:03 -0500
X-MC-Unique: ZDJZT8w2OxKTgLFytJlOEg-1
X-Mimecast-MFC-AGG-ID: ZDJZT8w2OxKTgLFytJlOEg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393e873962so12426675e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 03:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739274842; x=1739879642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBR1cGhrch6zxsjzkpgbtFU9OkZvzLf57IFsBLFTIrY=;
        b=k587zLok1SSmmr39sp6XzXSNe2jG8JzekfwtGYwV9jwwWE4FapFZGRMIMdeReG5ecG
         z1pfGxkUHWGyScnC3hEPIB4yIkyMlkFaKki7aAk4Edwyag7IogjpX6GKTaLjpa0ihBT/
         Gr4QmXAfpzU3K2ZNv6KkMJ2IUI6C6uaUcgN6e/I6hTFE6aDNGVyKzO+N+mr73cPy8124
         n3GuU8o1ecz3Wy3jYIcTnegXtj13QoihT3AojlVLzjCqqD6Ay+ZEWLw4lH6fvkg+Ol+/
         kijfX3ItXyRaBD0mZ08zOLWmhhqSau1UwTZCjBn0aNq0sREQpXGNPnWoaIlakuC8hV/z
         iBYg==
X-Gm-Message-State: AOJu0YwTwcxFsNm7QVMSIZNu1vevQBhwFPh+CrRZRc0mzv7egu3jYko1
	54B5N2cDMHsUKG1VJ1BMu5p0OCE6pOFW4UlWPK2jOZTYVntIlvlNhuA88VlYtCSV8QFJ9kWchwT
	4cAx1yB1cAAvcxsbV/oDDuGqbCNX/HKnsY8lda9lC4C6uTdfPLliQvqarDY8QTHK2
X-Gm-Gg: ASbGncv6GQxyGMaP0af09OqwgmbzmqSeCGLsfeRUwVLxYw5OlHRVK5PzExqQfTKGjEv
	81OwxQczWIBfitnb38xI/YbXFf5zZnvRQZ2rM3kQqSzgLCXbRik2hOBix1YifVCr5XxqhWvBIgs
	i8/FhuGEihQcX8MglLMwEi29MvvUjD5WKmYxrtpayG7aVi1V46572M8YEsVnpJMujTMQad+pTEJ
	MXj5SosvHSlbUQi22Y1iggUYl0trqQT34eUu7AucHSo7Ng3BcPDNS8BbK3dtxluNvJVCRLniA==
X-Received: by 2002:a05:600c:4706:b0:439:4d00:3ade with SMTP id 5b1f17b1804b1-4394d003e08mr22697045e9.26.1739274842106;
        Tue, 11 Feb 2025 03:54:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQw1UOVsiAcrCZcnGuaJ0PxxIXYaEGPgVE9SJ+k339IjbJb1mKn6V4YIrl7TNPbAqIbiC9pQ==
X-Received: by 2002:a05:600c:4706:b0:439:4d00:3ade with SMTP id 5b1f17b1804b1-4394d003e08mr22696745e9.26.1739274841683;
        Tue, 11 Feb 2025 03:54:01 -0800 (PST)
Received: from fedora ([78.243.229.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8047sm173185825e9.33.2025.02.11.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:54:01 -0800 (PST)
Date: Tue, 11 Feb 2025 12:53:58 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, adelva@google.com,
	gnurou@gmail.com, cohuck@redhat.com, daniel.almeida@collabora.com,
	ribalda@google.com, dverkamp@chromium.org,
	agordeev@qti.qualcomm.com, alex.bennee@linaro.org,
	nicolas.dufresne@collabora.com, gurchetansingh@google.com,
	changyeon@google.com, hverkuil@xs4all.nl, mst@redhat.com
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <Z6s6ViQr4rSxYZiI@fedora>
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
X-Mimecast-MFC-PROC-ID: 3KxDP8OgK2kNhab8chCzHhgq5dHAPbk6TYo39_THgPs_1739274842
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

You can follow the process outlined here:
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues
to get it merged.

Matias

