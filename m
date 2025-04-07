Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C91155A59
	for <virtio-comment@lists.linux.dev>; Mon,  7 Apr 2025 02:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743993705; cv=none; b=EoNubxctnT3XC4udoq8p3ir49WwMYJmIAwg/WXES64g78Con1bU9pPJeMOXQ0uACJGCrs3c1bu+scowo4BQ9ueXW7eGOhIv+57t4GUz1me28SAbE4LU2DZtLf3HrhXIHf93SwPZJPIUT/pPRvSzJ3UEBj/FCZ6KfkACEXsaNIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743993705; c=relaxed/simple;
	bh=+Y5CB67J19mVjqLJTnwBpZxCznTsyGkrRK3RqHbbnwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs0nCmYwrkRIhHCHw6k5LkM4xT9k5+aR3T6lqZWTvFvVe/hClp3hWVUEGe/1BT/RDTNKT8vW8/2hGya1+wB9ANUu3CP7WQvfGWsCPEO0Xh6pJLv26OX1Ls8UVoE3amR6HwZznTp2TJr4WGYw6MaOzar0W7hVDE9o0UApz/TdPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zwq8I254; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zwq8I254"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743993702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt/BW6ShmNwOh8fKevkcFFe01gqPQX1PPP7eIi1m8Qc=;
	b=Zwq8I254ED7Xdoq0mRnTAFqr2t66tCaZMJNuRx70+/pVkMWbAmO7nMKZDAf4yfmjIeDROD
	JYgJ2iBIRK3Jzd7efA/4/YtsfqmJQrxBIN7o+yyEWL1gN6XeQCJwVbE7RWEEzA86UmTu7x
	4cTYAgS1f7VRx8YcRjQMEaEAm6gGSL4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-MWtvf8PHNnqmgd5xL90qzA-1; Sun, 06 Apr 2025 22:41:40 -0400
X-MC-Unique: MWtvf8PHNnqmgd5xL90qzA-1
X-Mimecast-MFC-AGG-ID: MWtvf8PHNnqmgd5xL90qzA_1743993700
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af91804dd0bso2315168a12.2
        for <virtio-comment@lists.linux.dev>; Sun, 06 Apr 2025 19:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743993700; x=1744598500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jt/BW6ShmNwOh8fKevkcFFe01gqPQX1PPP7eIi1m8Qc=;
        b=omGe7r7a5rZ4S+ZMI/iWFpkknmGzNyMLqO2X/IkOg8INhAREHbqxUbbpQFS4xw4c0q
         sE2PjqT4iy6GAF7p/oOK94RvTiOsZbkuKwvgIVNGbowvhKLBrcRnfpLY2Yy/tqXHdp38
         rPuMME40lE+RbLpS6EmFWzFd6HLVh+lJznpSuA+XfPDBoUYkif3lv7xK7PB9zkKI959L
         qs62wCmpVgE+jxqnP4XGx7bQFspYeoSUZpWuJVnJkkE9lKAiKsogYWCfy24B1l+9uFx+
         XX/Swlyr4qFbZ8LfoPo5VwP4X3sWLMKLtaIm8rh7pWnwofwkqMBQuaLyMmC+akyUy5BB
         Q+yg==
X-Gm-Message-State: AOJu0Yw9K2X0sEX/2xsTvK7EYrRFwI3bksglPEFzZFGe58bo3wlJ2RvD
	pi/bEwh1O1t/ZX7VteVhshq6ARV8GHukTJn8vCrCctlTrtA6SHgTtjbYEXSBzP1UbHZ0K4+NRP2
	kYG22mN3Kq5VLMTsfX6XKSwn5TUbidVf8uZZCxIT5AaMtxgbA3xYoqhl+PnwtyIFJEpSNx9RVp4
	7wYNCv7WKBmJ8FoFxCO6FJgmp5FaEtaK/gezQsfGg=
X-Gm-Gg: ASbGncv+GCJ92YANpsXTdPwWPz94KuhXD4Ccgnl0tVG1EwzZvMFCTOkwJqJ+GMBagJc
	rL/IkKcUoluTbuTDJc6lkwgXp3c52kFvGtrIxhbUB+2dZ130MK07/SL3QG6b+9OhOTxTYCQ==
X-Received: by 2002:a17:902:f644:b0:220:ce37:e31f with SMTP id d9443c01a7336-22a9552ac51mr104155905ad.17.1743993699544;
        Sun, 06 Apr 2025 19:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPkCjYfpHEpufNRstNmM+jE3h5XSHJBC0H86i4losALHadSA4lQqJghscYlN+kWCK95nUtj+1lh7LhuqBkLd4=
X-Received: by 2002:a17:902:f644:b0:220:ce37:e31f with SMTP id
 d9443c01a7336-22a9552ac51mr104155625ad.17.1743993699045; Sun, 06 Apr 2025
 19:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com> <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
 <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com>
In-Reply-To: <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Apr 2025 10:41:27 +0800
X-Gm-Features: ATxdqUFel-jx5zdI-HhHbyGV0uoqeDrk58RFVsvNGP_DfDFC6tm_x8VQlKqz19s
Message-ID: <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pM6byDtGyDPRJfhfDLBCA8to2N6PQPrG4Klmndew1es_1743993700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 4:32=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/03/24 13:02, Jason Wang wrote:
> > On Fri, Mar 21, 2025 at 3:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> The previous description said:
> >>> A driver sets \field{max_tx_vq} to inform a device how many transmit
> >>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >>
> >> However, it also controls how many receive virtqueues a device MAY use=
.
> >> Copy the description of the virtqueue_pairs field of struct
> >> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, =
to
> >> clarify that.
> >
> > Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
> > sounds like a TX only thing.
>
> I'm no longer pursuing this change. Please see the discussion at:
> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com
>
> Please also review a change for QEMU based on the discussion:
> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.c=
om

Ok, so it seems that RSS implement a async RX/TX queue model instead
of the MQ queue pairs:

1) rx available queue were controlled by indirection table
2) tx available queue were controlled by max_tx_vq

So it introduces more "issues" like:

1) This calls a new uAPI as I suggested in another thread instead of
reusing TUN_SET_QUEUE
2) If both MQ and RSS are negotiated, what happens if the driver is
using both max_tx_vq and virtqueue_pairs. This seems unclear in the
spec itself.

THanks


>
> >
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   device-types/net/description.tex | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex
> >> index 76585b0..5178191 100644
> >> --- a/device-types/net/description.tex
> >> +++ b/device-types/net/description.tex
> >> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce Types / Network Device / Devi
> >>
> >>   Field \field{indirection_table} is an array of receive virtqueues id=
s.
> >>
> >> -A driver sets \field{max_tx_vq} to inform a device how many transmit =
virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >> +Field \field{max_tx_vq} specifies the number of the transmit and rece=
ive queues
> >> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq=
1\ldots
> >> +transmitqn and receiveq1\ldots receiveqn where n=3D\field{max_tx_vq} =
MAY be used.
> >>
> >>   Fields \field{hash_key_length} and \field{hash_key_data} define the =
key to be used in hash calculation.
> >>
> >>
> >> ---
> >> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> >> change-id: 20250321-tx-78e44c50a035
> >>
> >> Best regards,
> >> --
> >> Akihiko Odaki <akihiko.odaki@daynix.com>
> >>
> >
>

