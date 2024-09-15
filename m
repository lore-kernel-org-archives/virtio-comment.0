Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78A1C4613
	for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726398685; cv=none; b=c5CZl08aJ6uYntixv0v+ENsmMfSlFUWhGZrXu7fmzI6WJigg8x8hzFyZodt5Q9aRmfRidlIzcYomjUoRTShHw03eioDwAhgl5253sqHqmOqdaDGxwUthAd84fyRBRkCOpL05HSjBuoO1An9bavZj40BO2HI+TjN9Zc906yVu9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726398685; c=relaxed/simple;
	bh=0qbh1wg9ZfoZVAY4E+EjFfWJ8/keG9QmFz5rerCeHs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UbxF5AoR0ySYWTTl2s5puUFUohPyjMNzO+ePf53Grbug3lPmr+uT/98Po4+PjQhWhWkum0ZTH7COEJ+EAk3qufo7A5uIwcRUwFM5w9asFZf/AbUCirERVWiw/Kb0gE/qSXrgoquAspv9cgSgK3beHP9TepEGkYjvJpSYO04jA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpzFswui; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpzFswui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726398682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQHwnCEEmEyFS+wz9Z9WPf69WyjNtrOy1QtQHvFEQCg=;
	b=FpzFswuiF0Y8LJEwO5b5BiN9XpLCMjKyaFp4k3t1sDxWXdUFRNLs1n6tQp+xXUUPB2q524
	VKWHg/0linzn2u1fBh1JoQJDUliHx/41sVa8pPx5q2G0kBnO4th93+vUlkQadoXe/5fDnj
	fUqgY1nPaahR/ojvL7VO/2kjS1c3ua4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-N5nySAHDOXO5x6d9YlxefA-1; Sun, 15 Sep 2024 07:11:20 -0400
X-MC-Unique: N5nySAHDOXO5x6d9YlxefA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c960ee7aso1690231f8f.3
        for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 04:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726398679; x=1727003479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQHwnCEEmEyFS+wz9Z9WPf69WyjNtrOy1QtQHvFEQCg=;
        b=flC463TFpYZILKU6SZyA6D2PV7yQfAx5c338KrKHMPnJwBfGdDnMETVJjypUsjnLWl
         sdvtPZ6cQmt1D5OL2e7FmgR0gycgyKzp38ZYW1SHxO8K3oz5rJm/627OJcvzaxxIYa71
         jm0FAEUBKFbYWytFXDFlR2sjk+dyIgv7JrTrx+IIeKDY8sDYR6QeQ6JugMbInYO+4ttL
         NllhcBYS06Ny7OKJDMyT+jrgcFlXAgOPfpe5sRHiqmtcS/dSBYYJZum/J8irSNrXp7UF
         7J6z+rPwRFmKNvOKt1sSdP12FRgtaOLtf7i2FNVtIVLx0vNKfpPxsTrG9YrQZ30pgMQr
         By+Q==
X-Gm-Message-State: AOJu0Yw6LTE4sMuKxnHx1wVwF0NRU1Wq0XEoWKoAInonq9+ne9KhYXLH
	P1yg2ZLyFUyFK6CtC4eqOhzmHvJ7N2Eh8BXaAWRsUYRAslrVJXa0yC8kdfCsFvXh793KhVl1rZz
	RsUJV0aTiHWoMzQ0C7fRKQjkMgBs1FM/vHEWTDqvpYloHBER3CilIxc/auLEKAT0S
X-Received: by 2002:a5d:6d89:0:b0:374:c847:867 with SMTP id ffacd0b85a97d-378d62360e7mr8292129f8f.47.1726398679502;
        Sun, 15 Sep 2024 04:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKpgk75eXnOehz+wyikZuHYWMCAXsUT4nY+S9MkA6nsFcpn9WMtgp7E/kZXR/sZvWL9LbMNg==
X-Received: by 2002:a5d:6d89:0:b0:374:c847:867 with SMTP id ffacd0b85a97d-378d62360e7mr8292096f8f.47.1726398678988;
        Sun, 15 Sep 2024 04:11:18 -0700 (PDT)
Received: from redhat.com ([2.52.158.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7804483sm4391801f8f.92.2024.09.15.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:11:16 -0700 (PDT)
Date: Sun, 15 Sep 2024 07:11:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v1 0/2] Embed files as PDF attachments
Message-ID: <20240915071049-mutt-send-email-mst@kernel.org>
References: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Sep 15, 2024 at 10:56:29AM +0300, Manos Pitsidianakis wrote:
> The PDF specs allow for file attachments to documents. This can be used 
> to make the VIRTIO PDF spec a single source of truth by embedding 
> related files.
> 
> This series attaches the virtio-queue.h header file as a proof of 
> concept. It can be inspected and extracted using a compliant PDF viewer 
> such as Adobe's or Firefox's integrated PDF reader.
> 
> (Note: I'm not sure if Chrome supports it, my local version does not, 
> neither does Chromium.)
> 
> Programmatically extracting files is also possible, allowing for 
> downstream projects to update their headers by accessing the upstream 
> pdf file.
> 
> Example using the `pdfdetach` utility from the Xpdf package of tools 
> (`poppler-utils` package on debian/ubuntu):
> 
>   $ pdfdetach -list virtio-v1.3-csd01.pdf
>   1 embedded files
>   1: virtio-queue.h
>   $ pdfdetach -save 1 virtio-v1.3-csd01.pdf
>   $ file virtio-queue.h
>   virtio-queue.h: C source, ASCII text


Really cool, thank you Manos!

> Manos Pitsidianakis (2):
>   specvars.tex: Add \virtioauthor command
>   Embed virtio-queue.h as PDF attachment
> 
>  commands-html.tex |  7 +++++++
>  commands-pdf.tex  | 10 ++++++++++
>  headerfile.tex    |  2 ++
>  specvars.tex      |  3 ++-
>  virtio.tex        |  1 +
>  5 files changed, 22 insertions(+), 1 deletion(-)
> 
> 
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> -- 
> γαῖα πυρί μιχθήτω
> 

