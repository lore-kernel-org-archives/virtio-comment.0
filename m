Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274D01E1A12
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497814; cv=none; b=DaF7byKMclC6AJIDaMOQLX7dFXAbJO3ceAfM3xC9RJdSBQFLTks7rGn7AYUyI2pHdq5kkUxWzNyu58MWPJ5NcDlkf47v/U8K5V7/s1zAaSgiKo5rLsJ6JotvowBy34ub69D5Wmu2SFjHSCdnYI+XhxFRtfR6jEatI9lBRDgZ5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497814; c=relaxed/simple;
	bh=FrctctF2sZyrvOgGOpb19UmT0mD8SYsmq3MF5/9zAC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOcXI3Um/8rpsSFLawLMdcS2c75DnjccY9U980nExJ2jPNYTwyT82Uu2hv9JFkkJcGZKJk41l1068I0Rc6ztDwq6pIL6QK114IHcjfsPvNDqtkZDNmpc33xeGrI0IOjZ7D6PsXH1ZFC4f2Tux+AQAaddaK6vcsKWOppt7ICRzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bp6PeHnb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bp6PeHnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729497810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJ3EvUecXAa/gNi2OO3r9b8LOHsqrtjqf9QTsBu4NGs=;
	b=bp6PeHnb5n21CqR3fP12ki0NYAKvSk/dP32noU5thYGrWTAvK7sv5AVauEfvcVgSw7pyVV
	Y6Hq83p82fl3ZI0+wmz88Q+iHpAzz9xFNJDo62nsO97J+GPt0l9PxZeuzevMkjMMu3spuz
	k0/AlcsNtp47SjTkFdryinBBi21FN38=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-1-9-s805Of2oRHxDw5xOJw-1; Mon, 21 Oct 2024 04:03:28 -0400
X-MC-Unique: 1-9-s805Of2oRHxDw5xOJw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e2dcea0f03so5329304a91.1
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 01:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497808; x=1730102608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ3EvUecXAa/gNi2OO3r9b8LOHsqrtjqf9QTsBu4NGs=;
        b=RRYK9BzaOZJR+tMHiwJeU4ocnyZipKU2WKPnOdTljOUAJ1YlDSw2FyE0LHiwZzPUuM
         0ZmrE9h+59l6BFWV/p5SWrMP/uGXYgbVx5QbrImSJ3lLXkBBjzS0QoB9cBIal5kNR60X
         kyDaY9Jc2sbABh1+XZbe477wICokOT0YiXHQQZd4ytOyGTmZuhzjDDYyqLPvVTx3N+w+
         crkND1MhEpHS2gN3Z/nSYAHo01eTpuRsV0YYt3bc33Cy18EeuZAXl4LqzXX340bb2gel
         1XPWEOT9U7ZUovkSFnW3Ux3HT1sWCowybuEY6+yXrDv34LDYqKTS0ygxshx+0YHkXbWA
         BNGQ==
X-Gm-Message-State: AOJu0YwtruNcxpj+M1HMCoZjqcgzJhS91toE3DLBZ+CZiCGZhrXoIdLU
	boLcmdEhJrNS+QiHPbY7G3QeEVU1S/uEtsVDiWW7lha7Va+wc/85xJpCCwRQ5FWjdbb+SeHemya
	K03KWfVLHopbnf1dIaBjwIveVP3qe9ZvBVVQ+XfesrsTf9qG3XZA0FajAOmbYyhXoWjlO75TAC+
	yjLlfEhxXDVJ78E0t+DiQYcgBogbUr4ILx4xuSRcc=
X-Received: by 2002:a17:90b:3882:b0:2e2:d3a6:a84a with SMTP id 98e67ed59e1d1-2e561a32899mr12310824a91.39.1729497807802;
        Mon, 21 Oct 2024 01:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI4pRhrxVZnEg8EZF/1Fycaodl6CejO06ckVLnpjwOkEtRbsMja4pOGDyvl2h+Rwr36mqQhnZiH0gnq+c1jKM=
X-Received: by 2002:a17:90b:3882:b0:2e2:d3a6:a84a with SMTP id
 98e67ed59e1d1-2e561a32899mr12310808a91.39.1729497807391; Mon, 21 Oct 2024
 01:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
 <CABVzXA=fPgzLFqhvUfAXfqC2EAym2EgW0OVf4h7kv5Z3L5e3Fg@mail.gmail.com>
In-Reply-To: <CABVzXA=fPgzLFqhvUfAXfqC2EAym2EgW0OVf4h7kv5Z3L5e3Fg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 21 Oct 2024 10:03:15 +0200
Message-ID: <CADSE00KwiRp=3Rw9caO4XXdgxNKrJG2AuBEOwu1yaQ=Q_JZxeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com, 
	daniel.almeida@collabora.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, eballetb@redhat.com, 
	acourbot@chromium.org, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	cohuck@redhat.com, mst@redhat.com, agordeev@qti.qualcomm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 10:03=E2=80=AFPM Daniel Verkamp <dverkamp@chromium.=
org> wrote:
>
> On Thu, Oct 17, 2024 at 12:04=E2=80=AFAM Albert Esteve <aesteve@redhat.co=
m> wrote:
> >
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver or of Linux on the host or
> > guest side - V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> [...]
> > diff --git a/device-types/media/description.tex b/device-types/media/de=
scription.tex
> > new file mode 100644
> > index 0000000..793e9b1
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,583 @@
> > +\section{Media Device}\label{sec:Device Types / Media Device}
> > +
> > +The virtio media device follow the same model (and structures) as V4L2=
. It
> > +can be used to virtualize cameras, codec devices, or any other device
> > +supported by V4L2. The device assumes 64-bit little-endian V4L2 struct=
ures
> > +are exchanged. The complete definition of V4L2 structures and ioctls c=
an
> > +be found under the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
>
> I would omit the "The device assumes" part; this spec is defining the
> protocol used by both the device and driver.

Will do.
>
> It would also be nice to be a bit more explicit about the meaning of
> "64-bit"; presumably this means something like "struct layout matches
> the Linux psABI for <some 64-bit architecture>", although that's not
> great either IMO. Punting to the Linux docs rather than defining the
> structs in the virtio spec feels iffy to me (though this is also the
> approach taken by fs with fuse); hopefully none of the V4L2 structs
> use features like bitfields that could cause layout differences (and
> may not match the bit-field definition in the virtio spec), and
> hopefully Linux never introduces any new structs that don't make sense
> in virtio-media.

I see your point. But it has its advantages to do it this way.

I feel one of the points for taking this approach to begin with was
to actually leverage v4l2 specs to be able to keep up with API updates.
V4L2 API change relatively quickly (faster cadence that virtio), to
keep up with new devices and their needs.

At any point, if Linux introduces some struct that does not make
sense or breaks compatibility with virtio-media, we will be forced
to differ and explicitly set it in the virtio specification. But I think
this occurrence will be more scarce, if ever, compared to all the
support for new device that we obtain for free by just pointing
to V4L2 structs.

>
> Also, though this is more of an implementation-specific detail, I
> wonder how this will be handled by the Linux virtio-media driver; will
> it have code to convert between the 64-bit/little-endian layout used
> by virtio-media and the native V4L2 structs? Or is it assumed that the
> driver will never be used on a 32-bit or big-endian platform and
> structs can just be naively passed through without conversion?
>
> > +V4L2 is a UAPI that allows a less privileged entity (user-space) to us=
e video
> > +hardware exposed by a more privileged entity (the kernel). Virtio-medi=
a is an
> > +encapsulation of this API into virtio, turning it into a virtualizatio=
n API
> > +for all classes of video devices supported by V4L2, where the device p=
lays the
> > +role of the kernel and the driver the role of user-space.
> > +
> > +The device is therefore responsible for presenting a virtual device th=
at behaves
> > +like an actual V4L2 device, which the driver can control.
> > +
> > +Note that virtio-media does not require the use of a V4L2 device drive=
r or of
> > +Linux on any side - V4L2 is only used as a transport protocol,
> > +and both sides are free to convert it from/to any model that they wish=
 to use.
> > +
> > +This section relies on definitions from
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
>
> This is probably redundant, since it just repeats the "definition of
> V4L2 structures and ioctls" link earlier in this same section.
>
> [...]
> > +\subsection{Device Configuration Layout}\label{sec:Device Types / Medi=
a Device / Device Configuration Layout}
> > +
> > +The video device configuration space uses the following layout:
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_config {
> > +    le32 device_caps;
> > +    le32 device_type;
> > +    u8 card[32];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{device_caps}] (driver-read-only) flags representing the d=
evice
> > +capabilities as used in
> > +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-query=
cap.html#c.v4l2_capability}{struct v4l2_capabilities}.
>
> nit: This link is pointing to v4.9 docs rather than "latest" like the
> others. (Maybe using a specific version would be preferable to avoid
> link rot, but all the links should match.)

True, thanks for noticing. I will fix it.
Fixed version links may rot too. I think latest should be fine.
But you are right, they all should match.

>
> [...]
> > +\paragraph{Device Operation: V4L2 ioctls}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an o=
pen
> > +session.
> > +
> > +This command asks the device to run one of the `VIDIOC_*` ioctls on th=
e active
> > +session.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_ioctl {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 code;
> > +    /* Followed by the relevant ioctl payload as defined in the macro =
*/
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier of thesession to run=
 the ioctl on.
>
> nit: "thesession" is missing a space.
>
> > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl t=
o run.
> > +\end{description}
> > +
> > +The code is extracted from the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
ideodev.html}{videodev2.h},
> > +header file. The file defines the ioctl's codes, type of payload, and
> > +direction. The code consists of the second argument of the \field{_IO*=
} macro.
> > +
> > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > +
> > +\begin{lstlisting}
> > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > +\end{lstlisting}
>
> This should be more specific about the ioctl encoding, which is not
> consistent across architectures (_IOC_SIZEBITS can differ).
>
> > +This means that its ioctl code is \textit{4}, that its payload is a
> > +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.=
e., the
> > +payload is written by both the driver and the device).
> > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctl=
s payload}
> > +for more information about the direction of ioctls.
> > +
> > +The payload layout is always a 64-bit representation of the correspond=
ing
> > +V4L2 structure.
>
> As discussed above, "64-bit representation" is pretty vague, and this
> section should probably also describe the endianness requirement.
>
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{vi=
rtio_media_resp_ioctl}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_ioctl {
> > +    struct virtio_media_resp_header hdr;
> > +    /* Followed by the ioctl payload as defined in the macro */
> > +};
> > +\end{lstlisting}
> > +
> > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / =
V4L2 ioctls / Ioctls payload}
> > +
> > +Each ioctl has a payload, which is defined by the third argument of th=
e
> > +\field{_IO*} macro defining it.
> > +
> > +The payload of an ioctl in the descriptor chain follows the command st=
ructure,
> > +the reponse structure, or both depending on the direction:
>
> nit: "reponse" -> "response"
>
> > +\begin{itemize}
> > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > +follows the response in the device-writable section of the descriptor =
chain.
> > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > +follows the command in the driver-writable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver,
> > +meaning the payload must follow both the command in the driver-writabl=
e section
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
> > +
> > +A common optimization for \textit{WR} ioctls is to provide the payload=
 using
> > +descriptors that both point to the same buffer. This mimics the behavi=
or of
> > +V4L2 ioctls where the data is only passed once and used as both input =
and
> > +output by the kernel.
> > +
> > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device =
Types / Media Device / Device Operation / V4L2 ioctls}
> > +
> > +In case of success of a device-writable ioctl, the device MUST always =
write the
> > +payload in the device-writable part of the descriptor chain.
> > +
> > +In case of failure of a device-writable ioctl, the device is free to w=
rite the
> > +payload in the device-writable part of the descriptor chain or not. So=
me errors
> > +may still result in the payload being updated, and in this case the de=
vice is
> > +expected to write the updated payload. If the device has not written t=
he
> > +payload after an error, the driver MUST assume that the payload has no=
t been
> > +modified.
>
> How is the driver supposed to know "[i]f the device has not written
> the payload"? It would probably be clearer to say the driver may not
> assume anything about the state of the payload when an error is
> returned.
>
> [...]
>

