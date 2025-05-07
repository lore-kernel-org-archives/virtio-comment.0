Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF122F17A
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656069; cv=none; b=US9Y/ctmL7O8+0xyaiEikDDRODrnJ+N5/fjYuXDv6E7oxWdbgEYcZAiMZKZW/AkM47PBj2LJlXFzzzgRh8onFfYKfDsggGpNBN+cWPRQrJfSRLjJBh2+Xja11ptvX+LOfnHbTH4dvlUYoz6ZNvFBG4E4JBcFXdVbC1h6OGplvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656069; c=relaxed/simple;
	bh=X24Z8uL14tocp8xIKQWHW20iRkY2qKP3RDV7w2ikhMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Y2Jzk2c0p+gHjuqqAGgRvqMq0jNNNue7CK8uCBG66s9EaDQt7cMsBOBQqNDFKvR21plma5kw/QcAZSY4xKpXrUU5KP8EcDPh5j3a6/qnvtAVg8SyFTQtEPs9wDgL9eyYw14rYEwNwJ088Ncf7erdp3mYomdEvDUPhz4f2Dneax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDpfVatA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDpfVatA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746656066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bEF63q3dKEmEJkgMovxml8oMPcklTSRql+JZA6Or3w=;
	b=UDpfVatAqB3IhSsClEgCBdy1tbr0sNssMs7ZNVEzRV/PDgSaYHinMsJxHhAq1Fr9MP+75y
	WbR/zYw9d9tpRjtZbA6/XVJ1KbH8Z7jhK7cT7qUd18slRt0VQgD11ugE8a0muPOiwJtkBN
	pAl9G8nXoTpuHZFHSYzOEFXyl0f8baM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-pvAseM9hNRyJmnyNyxXuGA-1; Wed, 07 May 2025 18:14:25 -0400
X-MC-Unique: pvAseM9hNRyJmnyNyxXuGA-1
X-Mimecast-MFC-AGG-ID: pvAseM9hNRyJmnyNyxXuGA_1746656064
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-607f1847986so331226eaf.1
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 15:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746656064; x=1747260864;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bEF63q3dKEmEJkgMovxml8oMPcklTSRql+JZA6Or3w=;
        b=OVPbXMjAEeqpYmJN3BUgBrMrVIjL2gyZKH1XbOSlRyBfXYukOZywPACkoInYUy8ESj
         taP9AkpmWWEWCdAP+tf0TqbNtEuu228LMEtpwCvYjneEK4Ayb9Yrv1E3NZvPUU781hK8
         JK708ywqxy7igrOlJzbij29GMseNOXtBDCaJkwrrps9a6VszAXHFyooJfZo+xKMiNanO
         StHT2P81O/bEvgF2YEwX4dBa0J4Mve9qsh4N9i/39cIVQr6XiI7BjrdXv1uvqpP0AOa0
         I7bjOlPi5JbiQ3Eyzrgvf++GlDS9iF/Q5F7cMmNvuMIxP9AbuRNjqZdlfhR7/ChOqwsI
         j8eg==
X-Gm-Message-State: AOJu0YysaWtImHPtpn+sAMgjIkxuaFkgdQGFTKmy3gEoXhyn0WhZSKJc
	rhNTQkWH6XvL4K5DDxSG4rCSTwvcd3X1m2srOb2XByEtKtYwwz2EQ3wWFW9zQQS1961nQcCmuv+
	SeNCuhi7GVn6bwtq2WZzLWCtRO066r1iS90Jo731au0KAguY+qo7f0TKiAM4XP57NVZkyz3Erg1
	6v8ZgUr6rOLGrxtSZyORCo11vw7gLy81bIjtYr9Rvz/nTRytlrRQ==
X-Gm-Gg: ASbGncu/zQLj2WKjXUpFQBJgaWGk62YeVzpzZEZWWrI1BW0LiuUiv6eygtQKf9pF/CV
	AysoT21J74vfg4NZxPdE8on2RhpQ4FRAt0egPBmPBkAMX4PjlT7HTgpXJBNBRrulYzKryW4cZyR
	mxNfjZd9CixN57XbIH4dZobWM4Rzg=
X-Received: by 2002:a05:6870:d62c:b0:2c7:6ad3:fe56 with SMTP id 586e51a60fabf-2db5be482eemr3206472fac.15.1746656064226;
        Wed, 07 May 2025 15:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFynugvRCC865eJ0KEcH3QC0vjP1x2DcJJBgSQrk0jOisG9j7Zs0fw/RevqgPauo8UR0MqPlsV6X3R2moi+9CE=
X-Received: by 2002:a05:6870:d62c:b0:2c7:6ad3:fe56 with SMTP id
 586e51a60fabf-2db5be482eemr3206463fac.15.1746656063793; Wed, 07 May 2025
 15:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507152602.3993258-1-afaria@redhat.com>
In-Reply-To: <20250507152602.3993258-1-afaria@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 7 May 2025 23:13:46 +0100
X-Gm-Features: ATxdqUFU1tpx3fJepXyF4ujz9ScMOAxX9uqCYDKOY9Jn2Ocf_eVOS7OaiS2tlMM
Message-ID: <CAELaAXwjTW2fm-We63+CX3pSLFp=8F=zq99TnrN13fhW_APx4Q@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
To: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JKylq7xgti5hNrLkcqEQSovMSllhVpw4LcH_j9eDj-Y_1746656064
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:26=E2=80=AFPM Alberto Faria <afaria@redhat.com> wr=
ote:
>  \begin{lstlisting}
>  #define VIRTIO_BLK_T_IN           0
> @@ -457,6 +463,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
>  #define VIRTIO_BLK_T_DISCARD      11
>  #define VIRTIO_BLK_T_WRITE_ZEROES 13
>  #define VIRTIO_BLK_T_SECURE_ERASE   14
> +#define VIRTIO_BLK_T_OUT_FUA      15
>  \end{lstlisting}

I also missed that id 15 is already in use by zone commands. Will bump it t=
o 27.

