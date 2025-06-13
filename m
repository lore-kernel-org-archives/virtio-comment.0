Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E472605
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 04:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788614; cv=none; b=CNPqy20WIV/GN/VngxusRm3MZHKMMeGubxnKml7+bKPhO31rdIFokfdvyY7gQVSF4qQl3IZhAB5860RfrQaiLSHMfjKv2XXqGNj2zt1urp/6f9nWw0o5GbWnXpg/HNRGH7yHDPMD2kfH0nON0LgqfH33GjKQThGnuZzWkOs1jM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788614; c=relaxed/simple;
	bh=aLf3I51w8fBdRa5ViakOmOo1cvvoRItKJrQLn1oMzKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+PzEdKKHjjJq15pe3CF/5TEmgtsE+wlrwaiRNvHHTmRcRtqnQNtHfesV26TDSBLoTDNH6ogwssAajZXXJziZgGhpAJS8X8wCmHDQaXSMXPGtUKzoxoQg3Vk/rkcKTSwF859+l1KOU5LhyaWHWl532WLAyDRPSXfqtPwqhPVX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P4BkXDBS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P4BkXDBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749788610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLf3I51w8fBdRa5ViakOmOo1cvvoRItKJrQLn1oMzKg=;
	b=P4BkXDBShWlArRrZn3iHWHI97dPTGgN6Pa2NwjdNoCJAtSRZTT7e1wIh0qmtNm5mKc/NpJ
	BHH+1liu6em4vJckgH4x2R+/edUxyEK6PRHn3jXami4LJxzMY4BchEkG2nkmESP4B3o8Pk
	kxw4ROb1KmsD4XA+TVNS4T4lxbc6Ukc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-92u0XaqMNLShBzuptVuF0Q-1; Fri, 13 Jun 2025 00:23:29 -0400
X-MC-Unique: 92u0XaqMNLShBzuptVuF0Q-1
X-Mimecast-MFC-AGG-ID: 92u0XaqMNLShBzuptVuF0Q_1749788608
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84568so1098362a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 12 Jun 2025 21:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749788608; x=1750393408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLf3I51w8fBdRa5ViakOmOo1cvvoRItKJrQLn1oMzKg=;
        b=KDrw/G6+fG4DsoWiZM88HAr4X3ZCh9HZr39KCFphRj/Hsj1nySYwqcqhZB4mqf1LbJ
         YpdUj5f3tky3uALwTXHsOKkTfn+zubiKNR5S4Aa2IphB9W+1iBAaQyHzdtm5Au/HTSxe
         0eLqscBggHkIN5SBk5yeBUnKL7ahtY3/+iW5SDnDl97jHWN+hg5gayxbY/BJ3V5X/8Eu
         8/IN1gQhty8jGMgW+6J4+agSO0FfJOjQgxHUGc18D6/DXNctalTw7lb3HbTyfoh8Vxc1
         82nmBMf+y43MvXT78af1OCyoo/70UdcwIyBimUSOIgNXMAnv5sI2OUa7yRqJTiMGYok+
         VMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjez3hxi1qXWb9O9/C05yW09lJWvBdubjkwFpXtdI8+Bh2xt9IuJl1yRC89j/fGj7E7ciBM0ygLSWkBJ3p7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtxow7HK55SeXqPtpmj76kL2svC1bdGGWYckPxa7LmvTgPxEVx
	eYETqt/6PXeybCIxw6VsMvxh+Hh2Mpm67c2Q3+v8kC+fFUI3HTNPz3B60zgMCioBhtNT9BYod3n
	JovF0SzdPJtyjSl/IXOABCODFcs3Pa2dHSG3LxpGcXFh9HsjHaJIDKPWltfO5TRr4ch+/i7MmYu
	sqmQiPuZEvGi7qt5q1JLZwRCIbi7/qGlAOqj0eAXvwR90=
X-Gm-Gg: ASbGncvUPFUnE1CHj/FK73q7ostc6hhrx0sTCAdc4lTGGd+eqtSraM6mafL19NVAk2g
	A4SUt0urPZhbW3wGhZOUCJEkiCIb/GgPwd/8/iBKFJJKXkXhj6w0jgg7EmR0TeN9SbX6uF/yzDi
	ck
X-Received: by 2002:a05:6a20:a11b:b0:21f:54e0:b0a3 with SMTP id adf61e73a8af0-21faee4e610mr1516910637.2.1749788607985;
        Thu, 12 Jun 2025 21:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbC5qwfo1hIOZPpYwuYRNq9nfxpwAxnbZOzyBFFVC1llQ8tnMmzQjIelNfPsLTa7QubyjP2/6mhQowtAoSuX4=
X-Received: by 2002:a05:6a20:a11b:b0:21f:54e0:b0a3 with SMTP id
 adf61e73a8af0-21faee4e610mr1516884637.2.1749788607539; Thu, 12 Jun 2025
 21:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jun 2025 12:23:16 +0800
X-Gm-Features: AX0GCFtfGoa5ec0mmHaOec0K80l0ohbCympEcQV_T6gQRIrZOFR_AmW_sIWQtkc
Message-ID: <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, parav@nvidia.com, mst@redhat.com, 
	fupan.lfp@antgroup.com, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w2NecpRcpJ1siYUH5524rxYALv87AE_tjIbbemPu7nI_1749788608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.com>=
 wrote:
>
> This patch brings a new feature, called "multi devices", to the virtio
> vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> "device_order" field to the config for the virtio vsock.
>
> =3D=3D Motivition =3D=3D
>
> Vsock is a lightweight and widely used data exchange mechanism between ho=
st
> and guest. Currently, the virtio-vsock only supports one device, resultin=
g
> in the inability to enable more than one backend.

I wonder which part of the spec forbids more than one device.

> For instance, two devices
> are required: one to transfer data to the VMM via virtio-vsock, and anoth=
er
> to a user process via vhost-user-vsock.
>
> Apart from that, a side gain is that theoretically the performance might =
be
> improved since each device has its own queue. But it varies depending on
> the implementation.

It could implement multiqueue anyhow.

Thanks

