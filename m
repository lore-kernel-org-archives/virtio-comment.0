Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D822E338F
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742788989; cv=none; b=m1RzT9OHvkKYJICruZUsJXlVp6K6KG/yg5m57JYzPY480jKdTzKXQrF/yA1/jsQJV12kCSlyWfNzK3N1ufEWYo1tFmdPEhsl06sZW5XatGaVD+ReVuRtD3sodGjV6iqleiK4Z0Z3u+LU0umQDbkTWkb6lnu6z0PFk3HqgjExmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742788989; c=relaxed/simple;
	bh=vBPHAkGRLNnd1sa2w6VED+r/WKp18KZXbyKcX+QX8Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU0fbgMVaB8UHsZuX/RuyYbFskD2S9Pu/GqkH6scZNnGVPo4hJKuitl4iSlD+vDFsr0nbXuV/VnvLaOgYIDacj56TsnfuFT9VzdUVYPSqxYMQ10Kwg89lI6Y+gStVOeiXObmZRunIPRb8eb5xfmH6axHqAkRk6R9E5EOvgQoUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDQkBhPd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDQkBhPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742788986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edAeZ46TjlI0zYXQJMTSsHs34llrlm9AlrXc3GZS/tA=;
	b=ZDQkBhPdKtC9xKm69XM5POb3dHrrClA1I15jwtoRJkkwlPJ0jM2fwZ1PQJS8zZ3usRxqK6
	ce8LNIU+/7OSzGKF/sQY31qyeSVA1tzNVibMrLDpd9/o0V7GMqASnD1bcdgCBTp1s9jwt6
	r8Z5NchT7W3+NjadNG3Uboh7Dz4+hc4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-Or9ZngG4N7m2cTDgiIBdmA-1; Mon, 24 Mar 2025 00:03:04 -0400
X-MC-Unique: Or9ZngG4N7m2cTDgiIBdmA-1
X-Mimecast-MFC-AGG-ID: Or9ZngG4N7m2cTDgiIBdmA_1742788983
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff68033070so5953151a91.2
        for <virtio-comment@lists.linux.dev>; Sun, 23 Mar 2025 21:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742788983; x=1743393783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edAeZ46TjlI0zYXQJMTSsHs34llrlm9AlrXc3GZS/tA=;
        b=Pxe2NN1rm3jR8pw/huvR3ld3NRtMbvoor0kZFl3erAv7y6428bIMEBuIJQaWbT57wG
         dYMX0wiOo2IZ7kZDGb/CnWc1RzLsSB/NJq4MHgrizbu+RKqD6cgnkV14s4+urhG4hKk6
         /E7r0ohjt3cXwqjAnDbmnocvHn3nEZ7LzblDBgAkJk2X9/OyRttvMITEEzp4ux0Azjxg
         NKSSg0bq1BtEbgTwx/tS7rJcxvhNhQwbsYxrryp5Ga++WtPzDdPp8mW3R1cEquaW3f7h
         EXwAWodRh7jPetEmYRsgEAWXB+jr0K+wpM3rNWkBSgplvdrdF4HLeIhsUrnuuJkiAaz5
         N9aw==
X-Gm-Message-State: AOJu0YxOgfOwZeQ+utwn5RxrE/PzMbbJQV1Qdg62ChEIWgxKyJ6LPxXE
	Dmt4psnuKZ2Vv59w6oVEyIB0YOEWZiP6afP6l3HFYZ3Lzej2wr4kMvcdI51P6U3sSfb8LXUAoaA
	qtlA7LYfrocLuyjmHLcJPDRJlBap6vRvOkH7bQm/BlX/+DJuhaqP7GhAOPbEYaWVlZYjCuCwGKj
	+cL6UzEWqc8jJbh45s1NWN2JKHvTdSdj3o04Kxe+A=
X-Gm-Gg: ASbGncvXOUfPS5Q3GRtDiDVx+j9K9utx1+gLkJDupvUScUd4IrO96dWOqZ6UAZa3a9c
	7KvZD9p0UI8NCrEdIo5oIunPR9poEA3M7V9SPHTXk3gM4uYh/jpff4F5j0QxfUQ0k73/yfLo=
X-Received: by 2002:a17:90b:5450:b0:2fa:1e3e:9be7 with SMTP id 98e67ed59e1d1-3030fe6944amr17221948a91.5.1742788983333;
        Sun, 23 Mar 2025 21:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhLTAqWAp5mkfbPWa9Qopv7KCmDzlPCLmFviYF2A31yDUjR/i+0Tpuf/oj3n37HMaZbTCkD7H0dYznjEzeeUc=
X-Received: by 2002:a17:90b:5450:b0:2fa:1e3e:9be7 with SMTP id
 98e67ed59e1d1-3030fe6944amr17221912a91.5.1742788982797; Sun, 23 Mar 2025
 21:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
In-Reply-To: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Mar 2025 12:02:50 +0800
X-Gm-Features: AQ5f1JrQTrfIfvmS5-oc5Az368YlzBePTlsfGOulleRtZdQI71CX1KbFsNj54As
Message-ID: <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 66cHhqiK2IRtgxWuvYloOVs3lxhyT5MiovwBGu97aJY_1742788983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> The previous description said:
> > A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>
> However, it also controls how many receive virtqueues a device MAY use.
> Copy the description of the virtqueue_pairs field of struct
> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
> clarify that.

Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
sounds like a TX only thing.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  device-types/net/description.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..5178191 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>
>  Field \field{indirection_table} is an array of receive virtqueues ids.
>
> -A driver sets \field{max_tx_vq} to inform a device how many transmit vir=
tqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> +Field \field{max_tx_vq} specifies the number of the transmit and receive=
 queues
> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\l=
dots
> +transmitqn and receiveq1\ldots receiveqn where n=3D\field{max_tx_vq} MAY=
 be used.
>
>  Fields \field{hash_key_length} and \field{hash_key_data} define the key =
to be used in hash calculation.
>
>
> ---
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> change-id: 20250321-tx-78e44c50a035
>
> Best regards,
> --
> Akihiko Odaki <akihiko.odaki@daynix.com>
>

