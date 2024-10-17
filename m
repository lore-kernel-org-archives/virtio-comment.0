Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3A227B80
	for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195380; cv=none; b=enQa8IFkT0+uwAcPyhlfnVmZAiHJHut25mdUafoz3aR7NPOKlwLXFVOmGbp780OoDizOK9Gvb2TnNRXr3WuGIc9HnKCjO8SzaYsHQRBgxqkWKL8pB4Fn/Ss4jD6lrbnj0vr+dRhfStvhrvdLDE5ifWVmZqdUW83ybaBsVjtgI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195380; c=relaxed/simple;
	bh=q5Vz1vL87QzHcoCdzLNw3P0esct0CwurdTrPyo9TyqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfvGqr964OUwtVjJib7zZ/lksCk4GVrYeRzsl1tSQjveAqg99ocGDvVnjx37w5Z+B2xOejXc0JwVLwR/7JGHBKaZTT2zAShhwDv+bkIwuTXJdNhjwnu6MKrG4pD/o+Pmf8i/27pa+fh/HrsYN+jNH/3Q6eOhlGIELztrcyGpzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YiTTOj80; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YiTTOj80"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea6a4b3807so174675a12.3
        for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729195378; x=1729800178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dFlabIgfFtkOED7HEZrmtxWKFOtPaxENMBXgsQ79xM=;
        b=YiTTOj80Q7NgQz/igZ4o5n1a1EiqJRkOAG3+O9xxiKB+UYqUI4UdCpQSC5s4/XApAe
         okdmEdbxLdRPqRiT/P2OB4D0/gEw1BFTWQ2ALTPpn4Mf91cxlDSJtbnfq/OaMP9w8M7K
         zC3nVxLnF0SxovsQEhFvuSUd0AqMcNW/TaDsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195378; x=1729800178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dFlabIgfFtkOED7HEZrmtxWKFOtPaxENMBXgsQ79xM=;
        b=l0CE5RmA/Yv0IHdSGxA+kI/PszermPt5JqGDdaSb/e4rEOL9JZv8PMpDDlV+TeGPX9
         a2BGwnq6zaOJqSrDpYZ4H4JzGEiKMgSr41rIYA6dB4cSEBq+5BLxz5YMtvS+cOEDRaZq
         A2R8RJ3WHl+/NF7gz+WaXYQ1MmmcadKEP9w5hrbIIyEDvbQ21wzlJCjvSGEugvtpA2v9
         VxnpIUus0sJ+cOZpI+QV20wK3vksK+h/se0/EKNSsWQGGzsMCDYFOFqsIh5pydyP8Lmp
         9jsxNDxpD++oci4OPUCxxI1/qGbvC+70A3uxHnIRCAA9UuKoIFM96aKqSyuuPIL5Huhq
         +7cw==
X-Gm-Message-State: AOJu0YwoA5Cd8D24nac18uVx4KatDIm/Y6a/V2jxjjelYXJE1841+VM+
	jL8KJJIteQvrhL8iltqwo/TZSf3CEI3Js2ZS/OcKwc6KLZV60OGQvwLqMuMz4E826yapx5e0xhw
	yuROO
X-Google-Smtp-Source: AGHT+IEkfmZVAURf+7jp+qcVKQU+6uyZUvPfVU2sCPAcuoba2rLsGd4q9ONYAwGk1XUDsvJRsPn9vQ==
X-Received: by 2002:a17:90a:a883:b0:2e2:e545:82c6 with SMTP id 98e67ed59e1d1-2e5615d6183mr100502a91.2.1729195377652;
        Thu, 17 Oct 2024 13:02:57 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a71ec8fsm279345ad.14.2024.10.17.13.02.54
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 13:02:56 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso876759b3a.3
        for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 13:02:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd2:b0:71e:cb:e7bf with SMTP id
 d2e1a72fcca58-71ea31e96dfmr166120b3a.18.1729195373677; Thu, 17 Oct 2024
 13:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
In-Reply-To: <20241017070423.86706-2-aesteve@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Thu, 17 Oct 2024 13:02:26 -0700
X-Gmail-Original-Message-ID: <CABVzXA=fPgzLFqhvUfAXfqC2EAym2EgW0OVf4h7kv5Z3L5e3Fg@mail.gmail.com>
Message-ID: <CABVzXA=fPgzLFqhvUfAXfqC2EAym2EgW0OVf4h7kv5Z3L5e3Fg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com, 
	daniel.almeida@collabora.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, eballetb@redhat.com, 
	acourbot@chromium.org, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	cohuck@redhat.com, mst@redhat.com, agordeev@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 12:04=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
>
> Virtio-media is an encapsulation of the V4L2 UAPI into
> virtio, able to virtualize any video device supported
> by V4L2
>
> Note that virtio-media does not require the use of a
> V4L2 device driver or of Linux on the host or
> guest side - V4L2 is only used as a host-guest protocol,
> and both sides are free to convert it from/to any
> model that they wish to use.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
[...]
> diff --git a/device-types/media/description.tex b/device-types/media/desc=
ription.tex
> new file mode 100644
> index 0000000..793e9b1
> --- /dev/null
> +++ b/device-types/media/description.tex
> @@ -0,0 +1,583 @@
> +\section{Media Device}\label{sec:Device Types / Media Device}
> +
> +The virtio media device follow the same model (and structures) as V4L2. =
It
> +can be used to virtualize cameras, codec devices, or any other device
> +supported by V4L2. The device assumes 64-bit little-endian V4L2 structur=
es
> +are exchanged. The complete definition of V4L2 structures and ioctls can
> +be found under the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.h=
tml}{V4L2 UAPI documentation}.

I would omit the "The device assumes" part; this spec is defining the
protocol used by both the device and driver.

It would also be nice to be a bit more explicit about the meaning of
"64-bit"; presumably this means something like "struct layout matches
the Linux psABI for <some 64-bit architecture>", although that's not
great either IMO. Punting to the Linux docs rather than defining the
structs in the virtio spec feels iffy to me (though this is also the
approach taken by fs with fuse); hopefully none of the V4L2 structs
use features like bitfields that could cause layout differences (and
may not match the bit-field definition in the virtio spec), and
hopefully Linux never introduces any new structs that don't make sense
in virtio-media.

Also, though this is more of an implementation-specific detail, I
wonder how this will be handled by the Linux virtio-media driver; will
it have code to convert between the 64-bit/little-endian layout used
by virtio-media and the native V4L2 structs? Or is it assumed that the
driver will never be used on a 32-bit or big-endian platform and
structs can just be naively passed through without conversion?

> +V4L2 is a UAPI that allows a less privileged entity (user-space) to use =
video
> +hardware exposed by a more privileged entity (the kernel). Virtio-media =
is an
> +encapsulation of this API into virtio, turning it into a virtualization =
API
> +for all classes of video devices supported by V4L2, where the device pla=
ys the
> +role of the kernel and the driver the role of user-space.
> +
> +The device is therefore responsible for presenting a virtual device that=
 behaves
> +like an actual V4L2 device, which the driver can control.
> +
> +Note that virtio-media does not require the use of a V4L2 device driver =
or of
> +Linux on any side - V4L2 is only used as a transport protocol,
> +and both sides are free to convert it from/to any model that they wish t=
o use.
> +
> +This section relies on definitions from
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.h=
tml}{V4L2 UAPI documentation}.

This is probably redundant, since it just repeats the "definition of
V4L2 structures and ioctls" link earlier in this same section.

[...]
> +\subsection{Device Configuration Layout}\label{sec:Device Types / Media =
Device / Device Configuration Layout}
> +
> +The video device configuration space uses the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_media_config {
> +    le32 device_caps;
> +    le32 device_type;
> +    u8 card[32];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{device_caps}] (driver-read-only) flags representing the dev=
ice
> +capabilities as used in
> +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-queryca=
p.html#c.v4l2_capability}{struct v4l2_capabilities}.

nit: This link is pointing to v4.9 docs rather than "latest" like the
others. (Maybe using a specific version would be preferable to avoid
link rot, but all the links should match.)

[...]
> +\paragraph{Device Operation: V4L2 ioctls}
> +
> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an ope=
n
> +session.
> +
> +This command asks the device to run one of the `VIDIOC_*` ioctls on the =
active
> +session.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_ioctl {
> +    struct virtio_media_cmd_header hdr;
> +    u32 session_id;
> +    u32 code;
> +    /* Followed by the relevant ioctl payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] specifies an identifier of thesession to run t=
he ioctl on.

nit: "thesession" is missing a space.

> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to =
run.
> +\end{description}
> +
> +The code is extracted from the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vid=
eodev.html}{videodev2.h},
> +header file. The file defines the ioctl's codes, type of payload, and
> +direction. The code consists of the second argument of the \field{_IO*} =
macro.
> +
> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> +\end{lstlisting}

This should be more specific about the ioctl encoding, which is not
consistent across architectures (_IOC_SIZEBITS can differ).

> +This means that its ioctl code is \textit{4}, that its payload is a
> +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.e.=
, the
> +payload is written by both the driver and the device).
> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls =
payload}
> +for more information about the direction of ioctls.
> +
> +The payload layout is always a 64-bit representation of the correspondin=
g
> +V4L2 structure.

As discussed above, "64-bit representation" is pretty vague, and this
section should probably also describe the endianness requirement.

> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virt=
io_media_resp_ioctl}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_ioctl {
> +    struct virtio_media_resp_header hdr;
> +    /* Followed by the ioctl payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4=
L2 ioctls / Ioctls payload}
> +
> +Each ioctl has a payload, which is defined by the third argument of the
> +\field{_IO*} macro defining it.
> +
> +The payload of an ioctl in the descriptor chain follows the command stru=
cture,
> +the reponse structure, or both depending on the direction:

nit: "reponse" -> "response"

> +\begin{itemize}
> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> +follows the response in the device-writable section of the descriptor ch=
ain.
> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> +follows the command in the driver-writable section of the descriptor cha=
in.
> +\item \textbf{_IOWR} is writable by both the device and driver,
> +meaning the payload must follow both the command in the driver-writable =
section
> +of the descriptor chain, and the response in the device-writable section=
.
> +\end{itemize}
> +
> +A common optimization for \textit{WR} ioctls is to provide the payload u=
sing
> +descriptors that both point to the same buffer. This mimics the behavior=
 of
> +V4L2 ioctls where the data is only passed once and used as both input an=
d
> +output by the kernel.
> +
> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Ty=
pes / Media Device / Device Operation / V4L2 ioctls}
> +
> +In case of success of a device-writable ioctl, the device MUST always wr=
ite the
> +payload in the device-writable part of the descriptor chain.
> +
> +In case of failure of a device-writable ioctl, the device is free to wri=
te the
> +payload in the device-writable part of the descriptor chain or not. Some=
 errors
> +may still result in the payload being updated, and in this case the devi=
ce is
> +expected to write the updated payload. If the device has not written the
> +payload after an error, the driver MUST assume that the payload has not =
been
> +modified.

How is the driver supposed to know "[i]f the device has not written
the payload"? It would probably be clearer to say the driver may not
assume anything about the state of the payload when an error is
returned.

[...]
