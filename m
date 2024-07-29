Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE27D3F1
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288971; cv=none; b=BH96YaYN2MEH/yZwEnK/E9u7QdqXY/yK/eErMStQlsZ+Mr4k/p5crZd+2xTN72cGmStdIoOI2JYk7/2IesHBg2DIf1nc57P/GBUCsJsFb3B2D41uXTGDXzze1G/fyKKb24nC47ULjdBu9/JZ0FF8DZM++6+XDWzLKp6ms6g+CEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288971; c=relaxed/simple;
	bh=9UkAQxWjSmuQPGvErTNeOmxBAcTlbJomlpyfIqwDeUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oU0p9koQgTiP7ZBszDx38lAnqoy3oO5lhmpwQoQORZtZErm/z/ukt0V70sgl/h25jY4cKZFg1Jxqryb/U1z0BonLi4j4irpZXcVJLha7hNSyp2jR6HhHPaSSVZeCZVDf6FW+VUPqhUTJ+5VfpPtfVtPYAt+hSKbnmPFXjICHl3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojrVR/fi; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojrVR/fi"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44fe76fa0b8so108221cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722288968; x=1722893768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsECaPBkf2kBiOODuDN3lgkifAuicaZJwSxW7T/GTCk=;
        b=ojrVR/fiwHDAV7WG/ANdSNKHqWx1fjpjtfgYs3522oQrWHea81Nv0MQhgkO9T/5x8U
         RUKTcGeeaxIRcjsrydbF1LFte2QC7TOQBJtJPdg/775+HRMnoD3yFC2jwgjnC2SSuihS
         DbUaF5GIT8ljedIYrFcwDmlxIaxp0MMjUHoj+CJ08Jzt85jNtafgeWEQajvW+cTy0BBA
         RUbvGr/LY7/2axvqpw+9XRWBWKJ7s/zxcu2+oc6yAARIJOPja6sDUZGZLqchrukvA+nD
         dILN0K2oHNGkG0X0lR3Tmn4NXTBB8hnCBPVZTP6qBay/2lxdjPPZjWhtIcX9UA8sxieT
         Uucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722288968; x=1722893768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsECaPBkf2kBiOODuDN3lgkifAuicaZJwSxW7T/GTCk=;
        b=Q/6O64JpaVM5KNPUeMyb8Yh2xZJnJkTLy92ztSBPSLYKm2ODO7+i4Z8xN7f1VNetWY
         odSNNRbyo4gWkKoHSsmN/dVR/Od6Sz2YV42C1PhaEuAnzAO16PSjDa/st2TXeiuA9G/3
         CT+q7GRMZgYImiiinY/uULrnx2j7BGw+9yksxj6azFzurCRjM0l7C+j8RHjSNHU8nPsQ
         4qZcDtrj44HoTxWcj/veljVxg60Jf2nCdwYgWAa4sGNULDbpTEKuvKnqDU6ujXumTlas
         3ID16ic1oFi7ngQtU3BjKLXWUqv7DMYzzQm245fVPhxvCB90IWi1LvPvpHCmIi+cddpB
         0Xog==
X-Gm-Message-State: AOJu0Yy9On4Jt0kICiUp1Z8lNXlhVXFbp6DapexRrPs4XXTGO9pscer9
	NDc2i8P4Bt/4RkPe1WhR42BZkcWBIn9OH3F+sNK1iLYGGg9hPxP1eUB0F//9aKLf0kaA8dWv/e/
	LeJ12YU7CzwBNaF0gBtxTizhMoaSJZeWMvces
X-Google-Smtp-Source: AGHT+IG1jEUmsjEjKI08/mlYMZIEzPpB2iErTrk7uINnztkmD275z3oiYJGXfbZ9hFGHfmrJhK5w1d7z7lclA9i7Gik=
X-Received: by 2002:a05:622a:1b9e:b0:447:e2f0:4d17 with SMTP id
 d75a77b69052e-450367826efmr162781cf.7.1722288968089; Mon, 29 Jul 2024
 14:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <5b3829e774a0bd43b7cb7119446486df42094d43.1722252302.git.pabeni@redhat.com>
In-Reply-To: <5b3829e774a0bd43b7cb7119446486df42094d43.1722252302.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 29 Jul 2024 17:35:29 -0400
Message-ID: <CA+FuTScZMo3pOitzw3zqY8g7L_AE4LyaZnZEA3=a-vXOL5mP2Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 7:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> This complements the previous change, additionally
> introducing the UDP tunnel checksum offload feature.
>
> Differently from the plain checksum offload feature, this
> depends on UDP tunnel segmentation being available, as outer checksum
> computation for non GSO packets is cheap and H/W implementation of
> such feature is complex.
>
> UDP tunnel checksum offload does not introduce additional fields,
> instead leverages the outer transport offset introduced by the
> UDP tunnel segmentation feature to locate the outer checksum
> inside the packet.
>
> When  UDP tunnel checksum offload is enabled, the VIRTIO_NET_HDR_F_DATA_V=
ALID
> bit semantic is extended, in the device -> driver direction, to
> cover both the inner and the outer checksum validation.

> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
> +
>
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO pack=
ets
>    carried by a UDP tunnel.
>
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r encapsulated packets.

> +\begin{note}
> +The dependency between UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO is intentional=
ly
> +in the opposite direction with respect to the plain GSO features and the=
 plain
> +checksum offload because UDP tunnel checksum offload gives very little g=
ain
> +for non GSO packets is quite complex to implement in H/W.
> +\end{note}

Plan was to call this UDP_TUNNEL_GSO_CSUM, to make this implicit
dependency more explicit? It really only is checksum offload for the
outer checksum that this feature covers.

>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -399,8 +419,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>    VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> -  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
> -  are the input equivalents of the features described above.
> +  VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
> +  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
> +  the features described above.

Minor, not specific to this feature and more to the spec maintainers:

Does it make sense to put each constant on its own line? To avoid
having to edit existing lines when expanding. This is source text, so
that does not show in the generated output anyway:

and if it can do that then the
VIRTIO_NET_F_GUEST_TSO4,
VIRTIO_NET_F_GUEST_TSO6,
 VIRTIO_NET_F_GUEST_UFO,
VIRTIO_NET_F_GUEST_ECN,
VIRTIO_NET_F_GUEST_USO4,
 VIRTIO_NET_F_GUEST_USO6,
+ VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO,
are the input equivalents of the features described above.

The trailing comma is admittedly a bit ugly. If fixing that up, the
diff is still cleaner with one constant per line:

- VIRTIO_NET_F_GUEST_USO6
+ VIRTIO_NET_F_GUEST_USO6,
+ VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO

> @@ -490,7 +512,7 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>      new (16 bit ones' complement) checksum is placed by the device.
>
>    \item The TCP checksum field in the packet is set to the sum
> -    of the TCP pseudo header, so that replacing it by the ones'
> +    of the TCP pseudo header, so that replacing it with the ones'

Unintentional change?

> +  \begin{itemize}
> +  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
> +
> +  \item The outer UDP checksum field in the packet is set to the sum
> +    of the UDP pseudo header, so that replacing it by the ones'
> +    complement checksum of the outer UDP header and payload will give th=
e
> +    correct result.
> +  \end{itemize}

"set to the sum of the UDP pseudo header [of each segment]"?

as it will not be the UDP length of the gso packet.
