Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F41C28E
	for <virtio-comment@lists.linux.dev>; Thu, 23 Jan 2025 01:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737594171; cv=none; b=BIw/BOewGSYSSrdoBZrSPtOloPu4E3gI/XohDejDfI5tTyhXAPPgnXhNpremZ7rKgcbpXXZ6EYSh1aYgn50/cmlQ9mG2SE9iiagNlr9eAyYJAOxskdiv10FgQfnC8YTwbHASLjN/rGjessebOd/mQtUDxrBVCYOyI3cOKa5FmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737594171; c=relaxed/simple;
	bh=It140S2ME4K/V7IMYXM+oA6D3+rEHWJGqgdSteobh9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bcv3NXzyRGmD9+mblTNxJz54qfooOm0G7YrX3+YgeiOfjqC53e4U4c/MJtuQiak5D1FIX0evrEP7QQoribXFHN58X7FzqCYZ6EtivEKPa4DYdZ1JpbHqv8ZFGOiblTvP/B8dYFPDVR7rEqf1Y2LBCmz6UwJZwD4/89aPlyEox9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4cEcpxt; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4cEcpxt"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so532154a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 17:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737594169; x=1738198969; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8hO1LAHZovSitV0ryweOsOmHplaeWotDo3d8zgz7IY=;
        b=m4cEcpxt7Sz1KG2c3A+BztRUVscxmTAEZNE7aBqDq5nD7/HSHy+T8PLvev75XKoPGq
         sAEDcqZvPlJeb8iclat2QNkFIub00bREvQhFyHrMr6fOmnDheafeKkGWupAPmyv2pEDo
         5kAuWR5bg+6v7pac8IU/O5W3pFPn57CZg2aZfoV4AW84FQS10LGy/F+lr8Ss56BUI2o6
         98e9Kn5wroo22qqQt67UAQRHZog1AJ+FNAS+XYcindWzqUGWSfh/dmpgvm7TT4U1LuUv
         fTgFNHNyn+1QC4IHEvsUvXSdspz1BoILqeplIpu4LnELh7c91WyVf1jPUjyWwfvmZPC2
         hq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737594169; x=1738198969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8hO1LAHZovSitV0ryweOsOmHplaeWotDo3d8zgz7IY=;
        b=XY6iMCXQXvd7NkV8n8itTVDidMVZuMkVafA+csQBraa+ZYJpg7TD6WTt3vvdWLGtzY
         LZggNrxvNbTt2UAfidcOrr8ms2SalrMsAmsSM51+th2ob3/poNN3Br24e8Xe8zB4A246
         mvs0QhVtfjnzmoVNoQcTUiCbaLBXqy701uyTW7f3uQF7z4BNunhEOti+ybDaLXG7OSaX
         cYNQ33xK3yItDY1aLAb/7i29/YKjvmJm7y0+MeCj0EAAs7cQ5j+GMX8Rvga/E6af/bjs
         aEhTefjzCg1lKxd9VlmMMmz4lGk/Cd+TOn2oWy0HJypzHW4uz1vzHF8ItXLyZM3azRvm
         bM0A==
X-Forwarded-Encrypted: i=1; AJvYcCWWseSuaDsfHDNp43Quedn+LIkHrjp+ilyR141S7Waj/9eDvHioXFXfNTerTIJH95+08Qlfehsm5XfSGXJ89Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOvqwUUf7TH6+Wrm6a9S1YaMTcDtTmaAiJy/epNS1hOB8DmZZ2
	wjxVv5XVgKXhQ942s0LY7Zo7ttNr+fH9syJjof/rlBzKGZBzludwb8WFXtHZVRk=
X-Gm-Gg: ASbGnctQlsVipOBEKlPEDYjrCEpdX1OPoydmx/FaZJ5F6K/dTHflfpTI8hoSIZdLSpa
	UmpbOrYIDMW1D0PLjxl7rGE71oAjLA4acAI0/8cq0dWhX41h/2G8EdPFp/bN9+RbHn1Fs75Geq7
	FCRWxKH4+q3KX7b5qvWjJ5jNFmJD0jGAjwQ+q7GFp43UE3q/P47mECFnMWczxaNWHPxnsGzKdoB
	jCyNFj37+0eu3QtL3AJaHpsu3CE1dmkuL3tYJcFp89DV2e8VVtq/UooHu4er+dU8Ig1KyRN
X-Google-Smtp-Source: AGHT+IE110SRMHFQDmFw0yEtBseukb/KpvhpmIepOBVaQyb0VWUL3a2H8W02ePXoA6Tlsla6jcZjMw==
X-Received: by 2002:a05:6a00:240b:b0:728:b601:86df with SMTP id d2e1a72fcca58-72daf953cf5mr31225324b3a.10.1737594169029;
        Wed, 22 Jan 2025 17:02:49 -0800 (PST)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab817732sm12218386b3a.64.2025.01.22.17.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 17:02:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 10:02:42 +0900
Message-Id: <D791Q2LTEUEN.3M6WM486L4ETD@gmail.com>
Cc: <agordeev@qti.qualcomm.com>, <ribalda@google.com>,
 <acourbot@chromium.org>, <gurchetansingh@google.com>, <cohuck@redhat.com>,
 <daniel.almeida@collabora.com>, <changyeon@google.com>,
 <nicolas.dufresne@collabora.com>, <eballetb@redhat.com>,
 <dverkamp@chromium.org>, <hverkuil@xs4all.nl>, <mst@redhat.com>,
 <alex.bennee@linaro.org>, <acourbot@google.com>
Subject: Re: [PATCH v5 0/1] virtio-media: Add device specification
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Albert Esteve" <aesteve@redhat.com>, <virtio-comment@lists.linux.dev>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250120085015.956057-1-aesteve@redhat.com>
In-Reply-To: <20250120085015.956057-1-aesteve@redhat.com>

On Mon Jan 20, 2025 at 5:50 PM JST, Albert Esteve wrote:
> New attempt of including virtio-media
> device specification.

Thank you Albert!

On my end, I have (at long last) sent the driver for upstream review:

https://lore.kernel.org/linux-media/20250123-virtio-media-v1-1-81e2549b86b9=
@gmail.com/T/#u

>
> v4->v5:
> - Rewritten/clarified some parts
>   according to the reviews received.
> - Added missing links to V4L2
>   structures. Structs should
>   have a link on their first
>   appreance in the document.
> - Clarified memory type
>   semantic V4L2 equivalent.
>
> v3->v4:
> - Updated device ID to 48
>   (moved to the first free id)
> - Specified endianess on all
>   structures defined through
>   the spec (leXX)
> - Slightly improved the explanation
>   of the size (and endianess)
>   of the exchanged v4l2 structs
>   as part of the ioctl command
>   payload
> - Changed cmd_mmap offset size to
>   match the V4L2_QUERYBUF offset field
> - Fixed most comments on previous
>   version for small typos/rewrites.
>
> v2->v3:
> - Updated device ID to 49
> - Renamed virtio memory types so that
>   they are differentiated from V4L2
>   memory types
> - Memory types description slightly
>   rewritten, explicitely excluding
>   USERPTR support for guest userspace
>
> v1->v2:
> - Remove naming host/guest in the text
> - Explicitly specify endian-ness of the device
> - Change address by offset in the MMAP operation
> - Specify SHM region for MMAP operation
>
> Virtio-media came from a discussion on virtio-dev
> mailing list, which lead to presenting virtio-v4l2[1]
> specification as an alternative to virtio-video.
>
> Later, virtio-v4l2 was renamed to virtio-media[2]
> and published at:
>
> https://github.com/chromeos/virtio-media
>
> The repository above includes a virtio-media driver able
> to pass v4l2-compliance when proxying the vivid/vicodec
> virtual devices or an actual UVC camera using the
> V4L2 vhost device (available in the repository).
> It also includes a FFmpeg-based video encoder
> device. Steps to reproduce are also detailed[3].
>
> Recently, virtio-media has landed in AOSP[4].
>
> Furthermore, virtio-media got a proposal to reserve
> device ID 48, which was finally approved for
> inclusion in v1.4.
>
> There is some overlap with virtio-video in regards
> to which devices it can handle. However,
> they take different approaches, making them
> the preferable choice for different scenarios.
> Moreover, as virtio-media will likely be the virtualization
> solution for ChromeOS, Android, and possibly others, for
> media devices, this justifies the desire to include
> the specification in the next release despite
> the aforementioned overlap.
>
> Full PDF: https://drive.google.com/file/d/1XKpPDalkXcJe2ZjPpbtiOcgJRIWy-U=
Tf/view?usp=3Dsharing
> PDF with the media section only: https://drive.google.com/file/d/1fzvKEuY=
31vUF7ctQ0KK0CmfrDO5CdRFj/view?usp=3Dsharing
>
> [1] https://mail.google.com/mail/u/0?ui=3D2&ik=3D73ebd65ebd&attid=3D0.1&p=
ermmsgid=3Dmsg-f:1767388565327924962&th=3D1887068940754ee2&view=3Datt&disp=
=3Dinline&realattid=3Df_libalimc0
> [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665=
.html
> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> [4] https://cs.android.com/android/platform/superproject/main/+/main:exte=
rnal/virtio-media/
>
> Albert Esteve (1):
>   virtio-media: Add virtio media device specification
>
>  conformance.tex                           |  13 +-
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 617 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  12 +
>  device-types/media/driver-conformance.tex |  10 +
>  5 files changed, 649 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/media/description.tex
>  create mode 100644 device-types/media/device-conformance.tex
>  create mode 100644 device-types/media/driver-conformance.tex

