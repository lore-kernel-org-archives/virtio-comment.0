Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA621EF080
	for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742544133; cv=none; b=ZldM9d5GEd8KesB3Jyp+ZJOErK8jNkL8xlE9wkeS/Rd/DjwQkNTNgIxRZTLQCoG1cmlCELvs8AcU0ATLtJvGKEPAeb7jR8nrggJVonN/EiRvWDYKSO1cZp7Kv0GfWald3YaxkTq2ff9aTF8YSAWXTRojfWgDh1JC/SQIKvlqbBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742544133; c=relaxed/simple;
	bh=x6RL72ncPiz3+AG//7UZsX6POMNYNk9rcC0qjXgM9NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqJ//KTkJdw+fBO6eQVAVxA6BugwJMGZDFZCLgyWkLCzOzL/bK5KPU9fodrH2hvqYwx9QjzG5GZIaCqhG44B4K28zLjG9+kRRYQb2V7HF9mOrebyhgqXw0xGEqpQg055352ANPY+XK3sgXkfsoOr/xYvYJ7ScHNJ1kyfZdk6V9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=BYpVr+uc; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="BYpVr+uc"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47662449055so8695781cf.1
        for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742544129; x=1743148929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMyNGB1sVVNP8R/SYVznsz/cYsaMjOT7l8ILAmqc4wo=;
        b=BYpVr+ucYv0Sw5Pb74jSO6WqUxhVV8u5xEaHVsvn/27Wn9QqXap9R4uQJ96ZED9nS+
         3XbNBG0RIQM21ArXTy/U1fr4PLqQsM0lyjZ39pktf6r2RN5yvluI+5YnwZSL1OYa2isE
         xHTKsRNwiKQXujjOMzNatb0er7fJJoAsCstzwWhuuGysm2lJ7UsC0RlibwFtn5fYPr5F
         3fDvULLneYO4OVddhQz8RFHdk43j+bWC+RQKUii0xpsUqHGaNoBjqK3GPhNyq81apS8I
         qrQqSkLWa07aAvcPxFT4LgZkWgX7p+BMg3jzeebxwu7aJKPZFqxbM/EDwjIHKmuxQUR2
         nixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742544129; x=1743148929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMyNGB1sVVNP8R/SYVznsz/cYsaMjOT7l8ILAmqc4wo=;
        b=BOKQviCMHYh9TikghTkgfju9ckW5hAon7B/rx8O7llyuwkUAob+5Jmsgj5VQIux2Kw
         peU1qR54pz5hlfz5Dx3yNNRYlhfzddvT2yYntG0YI6QMQmUb6kLnmYJhIUNceP/lumyM
         YAcXHeNikUQFUk9+ytFerSODq0z0yRh9ye4akf4S5PyHCIL8AE0GjSDyTW8jEMUjM1K5
         HikRc7a08YZCWrkkQuR+Z0kh67+a3XVNAAroVWVBLe7Byx8DpLHTl2ZgK6UblG0hU4YX
         +Fuiu1obBAmRxpfD687PM3penLXqkk7525rKWizv8WkRJ5xD7+pL9fhG9YT8S6nKBn1I
         dYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWz1ZJyxoYJT+9FtuT1j4+R1zLqEDb/7U8HDKdkgBDIKGJxf3WoK13Tdu/p9ThRWuQPax8UWf+8Eyrzfbu2kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2PC7VY4TNkc57ncanrWRShjyes+4lqqjLguyuFoT+eVuZqCDL
	WbSZ4/6ZTmTf0Msv2EOsCg3vXOEd5tbUOg5qbOhX/DN2a2DGDfEsI2ig02RwhHlafxnaBGmwpeJ
	fyZaGTY0fZ5cEivrXQkjfCh6+Ph3Jn0sy0Wzgbg==
X-Gm-Gg: ASbGncu4TvMrU1XugAnw0O0z22tMgIujBp6dEQFmb+6SSbxgetbFEqwA7Ljjmnq57C9
	tPIPUIE03bdLHPvvPWnx1kt+tdsnaCbL0ehCYwQNmdQ8fBdYiXmHeltBEtrA0Axjcbg0SA1pUrN
	8cVpCq0JbT8DApZs2JRnpjvVPGWLgkgfD+g/qKaPNnfhmK6C+ZCsRSWieSZ4XP
X-Google-Smtp-Source: AGHT+IH1UygmigZeQtbJWcFYLt9ysbsfiKI5aezSi6fLteLk5xXV2cfYA6HhOLegS+4KdsMw1TUB6CtMmm1WP4f++oY=
X-Received: by 2002:a05:622a:1f08:b0:476:c650:9839 with SMTP id
 d75a77b69052e-4771de800d1mr27400491cf.51.1742544128817; Fri, 21 Mar 2025
 01:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
In-Reply-To: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 21 Mar 2025 10:01:57 +0200
X-Gm-Features: AQ5f1JpweEVhujz81R4c4caez3LB42rzQYi7P3uoMle87gBKk4GXrp3mbfOcz44
Message-ID: <CAOEp5OdKAQw3cex-rfdF8ZRY+nnLumN0DbfZ702WdvyyXFAmNA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 9:01=E2=80=AFAM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> The previous description said:
> > A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>
> However, it also controls how many receive virtqueues a device MAY use.

IMO, the meaning of this field is exactly as stated in the
specification, i.e. the driver informs the device how many tx vqs it
is going to use.
Usage of rx vqs is defined in the indirection table and should not be
somehow limited by this field.

> Copy the description of the virtqueue_pairs field of struct
> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
> clarify that.
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
