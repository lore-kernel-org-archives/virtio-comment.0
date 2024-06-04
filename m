Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBE1494CA
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717527932; cv=none; b=dx8lu+oEXHUSySr0fqGXYKPJQdrTSg0joRyGnECFtoHJMagu8gAheqFQ6khk+pnahJb9TQCoq37L+9uwTrVknS94ycJDq8xvSJU+Y/hoQfdinb2RYYJQSOD59tooWMsrcbjs/gPuHpIZh5xgvfNjMfvbzod8A4+JxtCEKugAmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717527932; c=relaxed/simple;
	bh=alZ4oVKu9zEHrQ/2Wql8mxEYQ7H2NdCeg3HP+Vk+g7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq5EkkKpb9gMuzL3WTNcc9TQuaPvgDr6gtqf4UN1jaYOg5TRVZAB4ofkSguCycPs5ydeOptVC962QchsSTZvZK/ElID3JDsWQ9O/G87nrv7ws/mfeqam6MAJazYud1zitapLSrwotdDvMxIufjrMY+UIHgmMwlPeyb5KOt5ExoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C1SG8H+p; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C1SG8H+p"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b90038cf7so4735329e87.0
        for <virtio-comment@lists.linux.dev>; Tue, 04 Jun 2024 12:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717527928; x=1718132728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alZ4oVKu9zEHrQ/2Wql8mxEYQ7H2NdCeg3HP+Vk+g7c=;
        b=C1SG8H+phAEhmHW8d05c5UpHG7aUlUYijkhb6D2aXq0VIAetR7p3goIMDeVX9L3U2d
         Mb52LndAngjq4lWKgTvN2dw+K1hSdaK2ANC3rhH8Fpdm5z6tJPSEG2CE7JKFw9d9Iu1I
         uWEVqFz6zITHSmkKX4oO/dzL4DOHEKT9AoPsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717527928; x=1718132728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alZ4oVKu9zEHrQ/2Wql8mxEYQ7H2NdCeg3HP+Vk+g7c=;
        b=NOVm4+VSWHYqSneebZQ3dnYz3aeFHB/wUx79coSRwEVCUcfGZePkV+Fn+wenoBHgr3
         pGPlGkLU5yhwngJLxNlBQjINk5JGNr7+jMXJY+L0hh/cB7GI6T8NGzwF32fsn82N/+nz
         k/sr3kJegbVd+cA8Z8FAqPj30B5Lq14GCOkcW09tYUjPVGTgZOVybmsQcFrk44vdSh2V
         1mT4WGPBvOczqoXVGmFcUiG0l8cN0BScNoAL1xf/x7EmpVke2OUnRUJ4F8jMP/g4DQAH
         ihNQvFIGlvaxhR7ObksmcmqBe8CusFOHRaofZ6+ZAVxso6Ai7Jdsm9WQKlSquIDk01fe
         XzWg==
X-Forwarded-Encrypted: i=1; AJvYcCVqD6/C7CqsF9X1DqSF/Xy4gpW+FTdW1eHV6GWJfMOAO/iujisvlRyhZoYxlozJsfHOkn2wqffWcv8mMYo0cE375VmhC4QWzfnkpV2FN0I=
X-Gm-Message-State: AOJu0Yy5X8tg+X1ndYtM/mOJfqdcfgvyKKTRMQ6cwmZxXy8XkzsMEXBA
	OcZ2Knsc5kSxLQoRuDd0sRBFHJoinyUyX5gYL1f1TBC7D1SSvQx4wRh38igaqLn0wtgVi+17zT4
	zaPKS
X-Google-Smtp-Source: AGHT+IGdGLLt3ZqOeFXRFQJMWkef3q2qQ0poksG+RBWlTsXE5nyI1Gi4dX2wct7SaUpiBH4NvXRw3A==
X-Received: by 2002:a05:6512:36cf:b0:523:48f2:e3fd with SMTP id 2adb3069b0e04-52bab4bc9f0mr220405e87.16.1717527928233;
        Tue, 04 Jun 2024 12:05:28 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9e8e2f8dsm468981e87.92.2024.06.04.12.05.27
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 12:05:27 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b92e73e2fso4229447e87.2
        for <virtio-comment@lists.linux.dev>; Tue, 04 Jun 2024 12:05:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDO+nuf63COyc/AG4DajN2pmZ6yixcuv1YtNT+aiROaXx7ojrulZpyDCWujbv8Rc9EV39OWS3jHALgukdKEZ64rAnwahzt9BVAv/lI3Rw=
X-Received: by 2002:a19:f813:0:b0:529:adb8:dfc9 with SMTP id
 2adb3069b0e04-52bab4f97e4mr238601e87.66.1717527926423; Tue, 04 Jun 2024
 12:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240604090344.225934-1-lingshan.zhu@amd.com>
In-Reply-To: <20240604090344.225934-1-lingshan.zhu@amd.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Tue, 4 Jun 2024 12:04:59 -0700
X-Gmail-Original-Message-ID: <CABVzXAk1kmOwgWEEDrxoEJcf7r=Hp=ki9q0Kka9kzN6Q+04zBA@mail.gmail.com>
Message-ID: <CABVzXAk1kmOwgWEEDrxoEJcf7r=Hp=ki9q0Kka9kzN6Q+04zBA@mail.gmail.com>
Subject: Re: [V4] virtio: introduce SUSPEND bit in device status
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com, 
	virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 2:04=E2=80=AFAM Zhu Lingshan <lingshan.zhu@amd.com> =
wrote:
>
> This commit allows the driver to suspend the device by
> introducing a new status bit SUSPEND in device_status.
>
> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> which indicating whether the device support SUSPEND.
>
> This SUSPEND bit is transport-independent.
[...]
> +\section{Device Suspend}\label{sec:General Initialization And Device Ope=
ration / Device Suspend}
> +
> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> +SUSPEND bit in \field{device status} to suspend a device, and can
> +clear the SUSPEND bit to resume a suspended device.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And=
 Device Operation / Device Suspend}
> +
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SU=
SPEND is not negotiated.
> +
> +Once the driver sets SUSPEND to \field{device status} of the device:
> +\begin{itemize}
> +\item The driver MUST re-read \field{device status} to verify whether th=
e SUSPEND bit is set.
> +If not, the device does not support the SUSPEND feature.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any fields of any virtqueues or kick an=
y virtqueues.

nit: "kick" is not the terminology used in the spec; perhaps this
could be something like:
"The driver MUST NOT notify the device."

Thanks,
-- Daniel
