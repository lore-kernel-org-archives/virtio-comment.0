Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2101E0E03
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496992; cv=none; b=FRDvTjowYMRQzljxc819iPgIJovZTrim3Y+wn3UfZ+IfLCkwrZqBOYyrow+pw4/Gy4hEPoAj7i8+nH59VmVJ1X9GNOtBKFd413iVELpCjumakuhtvfQSmtXiZUw3UBbonHhEwetVOlftUkRL/JQKqnGrRzaqZj5kyq8xPeyXihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496992; c=relaxed/simple;
	bh=ap4GliLTHR9Hghwt5oZE4bTVWOpwL5gZycmxjQxoubI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekksygA/Dgmw4juSahSizJGG1vZ3nzxnTVI0HivNokKbgIBvjiTKvMGZjUk1IfoNwvuSKIURbSKw9RsA5L2gCmR2p9iRwiW6hFa/4dp8BDNrZIbfUgQPc5Cs8zZouZY9kDk+iO5fhyHZfnmKZkV5Pd8jp/QmSv0sREbqtOBBKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AY6YSDgD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AY6YSDgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729496988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3+hiX3j6QB88h1ZO06wUaSImY9wyfNfnS77ZFE72ng=;
	b=AY6YSDgDcbRcCjzo3vD5wQ43yNCupfn8LUuyC4S8cDHmFIM8HnpQATJH9OCfSIslN1DQkn
	CKvrdkp3RubfsYVWxHWm6SXvDHmsA9SCMDzICP4RoPWk7x+kt0tBfb4TvDNBdtOtmJsByN
	/dWRWXD5JW2xHNAv7/T2lbPAjvIGqSs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-EunQcllnPGi-VMuM6aHz1g-1; Mon, 21 Oct 2024 03:49:47 -0400
X-MC-Unique: EunQcllnPGi-VMuM6aHz1g-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e2ed2230fcso4238660a91.0
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 00:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496986; x=1730101786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3+hiX3j6QB88h1ZO06wUaSImY9wyfNfnS77ZFE72ng=;
        b=Q3EY+27eDb/FKSA9Kd7UhKByfEg/vlGh6NZUA62ppO283qNpvi7UtMj+BBgrrSiTk/
         PCxu8WlZr1F0ziAQXv3v9O9ZSrL3kkLItpq49vk4zsy6VpwYiwlCR4+ovEj/8SYtU7tS
         2UpHaf+R5bATEEJ4ywn3VdPxrMFjCTVfc42Y3Ijzt34s5LX/sKAfH6OBWQS/vflkQmXv
         2gpZE3+rfpHwuNOAR02bm2XMQ8NbuOeNF+gQXtJlotbhRswaWKSO9NWDEoMVb7HiH8Mh
         z5X7YJ1KHfTaIySvkOcN8cXhltwJxljZAKoPpzTFyk7LChAmYj/T1BXH4RsAn90U+Cqc
         Em1Q==
X-Gm-Message-State: AOJu0YzhjcX5+WQBNf5BosNSlCu3Hu3FlAsfJkiHap+uL2t7a2UJAAjP
	Wzcm4FpAEeQwkASuQ0nwWP7REaZmcHMwYVVGNcq7Zk9xHLJ59yZgebq/OlEAr8BzltHAOetm+RF
	vSYrvxKRMF5MpNpcUAcHvi8vj/bORa7WuWp/UDfjXnhku8bsCGlyJ6IaSSnIw+a0IkJ0hPJHpj5
	rKYNuBZ5w4S+Qjh004LPhddbzqkawC6458SCVemOM=
X-Received: by 2002:a17:90b:4b4c:b0:2dd:4f6b:638d with SMTP id 98e67ed59e1d1-2e561658840mr11286471a91.17.1729496986246;
        Mon, 21 Oct 2024 00:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2eGKZoI7Zi5QAViWbWp9p5R82z8pJel1WbSoDg3ZdKtyPdyDGn9wOTR+7Uo+n4eGSBpL2leIFdTMTBVEeWcc=
X-Received: by 2002:a17:90b:4b4c:b0:2dd:4f6b:638d with SMTP id
 98e67ed59e1d1-2e561658840mr11286461a91.17.1729496985791; Mon, 21 Oct 2024
 00:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
 <CY8PR12MB71950D7DC2CC73EEB94CD12BDC402@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB71950D7DC2CC73EEB94CD12BDC402@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 21 Oct 2024 09:49:34 +0200
Message-ID: <CADSE00JqrZOB9SGYO0MqQte9MXfg+N5TAoFZ8E9Wuc+rabLm=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"changyeon@google.com" <changyeon@google.com>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, "ribalda@google.com" <ribalda@google.com>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "eballetb@redhat.com" <eballetb@redhat.com>, 
	"acourbot@chromium.org" <acourbot@chromium.org>, 
	"gurchetansingh@google.com" <gurchetansingh@google.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>, 
	"agordeev@qti.qualcomm.com" <agordeev@qti.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Albert Esteve <aesteve@redhat.com>
> > Sent: Thursday, October 17, 2024 12:34 PM
> > Subject: [PATCH v3 1/1] virtio-media: Add virtio media device specifica=
tion
> >
> > Virtio-media is an encapsulation of the V4L2 UAPI into virtio, able to =
virtualize
> > any video device supported by V4L2
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver or of Linux on the host or guest side - V4L2 is only=
 used as a
> > host-guest protocol, and both sides are free to convert it from/to any =
model
> > that they wish to use.
> If it is v4l2, any reason to still call it virtio-media? How about virtio=
-v4l2 to describe what it is.

Originally it was virtio-v4l2, but it was changed along the way.
I think that the main reason is to avoid the possible confusion
that the virtio device requires v4l2 in the host and/or the guest,
when in fact just leverages v4l2 to define the communication
between device and driver. This strategy allows the virtio device
to keep up with API updates without having to explicitely
adapt the specification often.

I think the name virtio-media makes sense and describes the
device better. But acourbot@chromium.org could explain it
(and keep me honest with what I said above) with more detail,
as he is the owner and creator.

>
> [..]
> > +/* Header for all virtio commands from the driver to the device on the
> > +commandq. */ struct virtio_media_cmd_header {
> > +     u32 cmd;
> > +     u32 __padding;
> > +};
> Please fix u32 to le32 here and all other places.
>
> > +
> > +/* Header for all virtio responses from the device to the driver on th=
e
> > +commandq. */ struct virtio_media_resp_header {
> > +     u32 status;
> > +     u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +A command consists of a command header
> > \textit{virtio_media_cmd_header}
> > +containing the following device-readable field:
> > +
> > +\begin{description}
> > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*=
).
> > +\end{description}
> > +
> > +A response consists of a response header
> > +\textit{virtio_media_resp_header} containing the following device-writ=
able
> > field:
> > +
> > +\begin{description}
> > +\item[\field{status}] indicates a device request status.
> > +\end{description}
> > +
> > +The status field can take 0 if the command was successful, or one of
> > +the standard Linux error codes if it was not.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue:
> > +Sessions}{Device Types / Media Device / Device Operation / Command
> > +Virtqueue}
> > +
> > +Sessions are how the device is multiplexed, allowing several distinct
> > +works to take place simultaneously. The driver needs to open a session
> > +before it can perform any useful operation on the device.
> > +
> > +\paragraph{Device Operation: Open device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > +
> > +This is the equivalent of calling \textit{open} on a V4L2 device node.
> > +The driver uses \textit{virtio_media_cmd_open} to send an open request=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_open {
> > +    struct virtio_media_cmd_header hdr; }; \end{lstlisting}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with
> > \textit{virtio_media_resp_open}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_open {
> > +    struct virtio_media_resp_header hdr;
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> I didn't read the spec fully but please explore admin commands as they of=
fer resource (session) create/destroy infrastructure already.
> And v4l2 will get simplified a lot by reusing existing virtio admin frame=
work.

Thanks, I'll check.

>
>
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the current
> > +session. The identifier can be used to perform other commands on the
> > session, notably ioctls.
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Open device}{Device
> > +Types / Media Device / Device Operation / Open device}
> > +
> > +Upon success, the device MUST set a \field{session_id} in
> > +\textit{virtio_media_resp_open} to an integer that is NOT used by any =
other
> > open session.
> > +
> > +\paragraph{Device Operation: Close device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> > +
> > +This is the equivalent of calling \textit{close} on a previously opene=
d
> > +V4L2 device node. All resources associated with this session will be f=
reed.
> > +
> > +This command does not require a response from the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_close {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the session to c=
lose.
> > +\end{description}
> > +
> > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device
> > +Types / Media Device / Device Operation / Close device}
> > +
> > +The session ID SHALL NOT be used again after queueing this command.
> > +
> > +\paragraph{Device Operation: V4L2 ioctls}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an
> > +open session.
> > +
> > +This command asks the device to run one of the `VIDIOC_*` ioctls on th=
e
> > +active session.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_ioctl {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 code;
> > +    /* Followed by the relevant ioctl payload as defined in the macro
> > +*/ }; \end{lstlisting}
> > +
> This maps to modify or it can be new command.

What do you mean?

>
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier of thesession to run=
 the ioctl
> > on.
> > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl t=
o run.
> > +\end{description}
> > +
> > +The code is extracted from the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
i
> > +deodev.html}{videodev2.h}, header file. The file defines the ioctl's
> > +codes, type of payload, and direction. The code consists of the second
> > +argument of the \field{_IO*} macro.
> > +
> > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > +
> > +\begin{lstlisting}
> > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > +\end{lstlisting}
> > +
> > +This means that its ioctl code is \textit{4}, that its payload is a
> > +\textit{struct v4l2_format}, and that its direction is \textit{WR}
> > +(i.e., the payload is written by both the driver and the device).
> > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctl=
s
> > +payload} for more information about the direction of ioctls.
> > +
> > +The payload layout is always a 64-bit representation of the
> > +corresponding
> > +V4L2 structure.
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with
> > \textit{virtio_media_resp_ioctl}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_ioctl {
> > +    struct virtio_media_resp_header hdr;
> > +    /* Followed by the ioctl payload as defined in the macro */ };
> > +\end{lstlisting}
> > +
> > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device /
> > +V4L2 ioctls / Ioctls payload}
> > +
> > +Each ioctl has a payload, which is defined by the third argument of th=
e
> > +\field{_IO*} macro defining it.
> > +
> > +The payload of an ioctl in the descriptor chain follows the command
> > +structure, the reponse structure, or both depending on the direction:
> > +
> > +\begin{itemize}
> > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > +follows the response in the device-writable section of the descriptor =
chain.
> > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > +follows the command in the driver-writable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver, meanin=
g
> > +the payload must follow both the command in the driver-writable sectio=
n
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
> > +
> > +A common optimization for \textit{WR} ioctls is to provide the payload
> > +using descriptors that both point to the same buffer. This mimics the
> > +behavior of
> > +V4L2 ioctls where the data is only passed once and used as both input
> > +and output by the kernel.
> > +
> > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device
> > +Types / Media Device / Device Operation / V4L2 ioctls}
> > +
> > +In case of success of a device-writable ioctl, the device MUST always
> > +write the payload in the device-writable part of the descriptor chain.
> > +
> > +In case of failure of a device-writable ioctl, the device is free to
> > +write the payload in the device-writable part of the descriptor chain
> > +or not. Some errors may still result in the payload being updated, and
> > +in this case the device is expected to write the updated payload. If
> > +the device has not written the payload after an error, the driver MUST
> > +assume that the payload has not been modified.
> > +
> > +\subparagraph{Handling of pointers in ioctl payload}
> > +
> > +A few structures used as ioctl payloads contain pointers to further
> > +data needed for the ioctl. There are notably:
> > +
> > +\begin{itemize}
> > +\item The \field{planes} pointer of
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
u
> > +ffer.html#struct-v4l2-buffer}{struct v4l2_buffer}, which size is deter=
mined by
> > the length member.
> > +\item The \field{controls} pointer of \textit{struct
> > +v4l2_ext_controls}, which size is determined by the count member.
> > +\end{itemize}
> > +
> Can you please screen it through, and make sure that in this UAPI there i=
s no u16/32/64 data type.
> And all are leX or beX, to not assume any endianness between driver and d=
evice?

Sure, makes sense.

>
>
> > +If the size of the pointed area is determined to be non-zero, then the
> > +main payload is immediately followed by the pointed data in their orde=
r
> > +of appearance in the structure, and the pointer value itself is ignore=
d
> > +by the device, which must also return the value initially passed by th=
e driver.
> > +
> > +\subparagraph{Handling of pointers to userspace memory}
> > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace
> > +memory}
> > +
> > +A few pointers are special in that they point to userspace memory in
> > +the original V4L2 specification. They are:
> > +
> > +\begin{itemize}
> > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
u
> > +ffer.html#struct-v4l2-plane}{struct v4l2_plane} (technically an unsign=
ed long,
> > but designated a userspace address).
> > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > +\end{itemize}
> > +
> > +These pointers can cover large areas of scattered memory, which has th=
e
> > +potential to require more descriptors than the virtio queue can
> > +provide. For these particular pointers only, a list of \textit{struct
> > +virtio_media_sg_entry} that covers the needed amount of memory for the
> > +pointer is used instead of using descriptors to map the pointed memory
> > directly.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_sg_entry {
> > +     u64 start;
> > +     u32 len;
> > +     u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +For each such pointer to read, the device reads as many SG entries as
> > +needed to cover the length of the pointed buffer, as described by its
> > +parent structure (\field{length} member of \textit{struct v4l2_buffer}
> > +or \textit{struct v4l2_plane} for buffer memory, and \field{size}
> > +member of \textit{struct v4l2_ext_control} for control data).
> > +
> > +Since the device never needs to modify the list of SG entries, it is
> > +only provided by the driver in the device-readable section of the
> > +descriptor chain, and not repeated in the device-writable section, eve=
n for
> > WR ioctls.
> > +
> > +\subparagraph{Unsupported ioctls}
> > +
> > +A few ioctls are replaced by other, more suitable mechanisms.
> > +
> > +\begin{itemize}
> > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuratio=
n
> > +area (see \ref{sec:Device Types / Media Device / Device Configuration
> > Layout}).
> > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event (see
> > +\ref{sec:Device Types / Media Device / Device Operation / Dequeue buff=
er}).
> > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event (see
> > +\ref{sec:Device Types / Media Device / Device Operation / Emit an even=
t}).
> > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are
> > +deprecated and replaced by the controls of the JPEG class.
> > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall
> > +not be implemented by the device.
> > +\end{itemize}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unsupported
> > +ioctls}{Device Types / Media Device / Device Operation / Unsupported
> > +ioctls}
> > +
> > +If being requested an unsupported ioctl, the device MUST return the
> > +same error response as it would for an unknown ioctl, i.e. \textit{ENO=
TTY}.
> > +
> > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP
> > buffer into
> > +the driver's address space.
> > +
> > +Shared memory region ID 0 is used to map MMAP buffers with the
> > +\textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > +
> > +struct virtio_media_cmd_mmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     u32 session_id;
> > +     u32 flags;
> > +     u64 offset;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{flags}] is the set of flags for the mapping.
> > +\field{VIRTIO_MEDIA_MMAP_FLAG_RW} can be set if a read-write mapping
> > is
> > +desired. Without this flag the mapping will be read-only.
> > +\item[\field{offset}] corresponds to the \field{mem_offset} field of
> > +the \textit{union v4l2_plane} for the plane to map. This field can be
> > +obtained using the \textit{VIDIOC_QUERYBUF} ioctl.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with
> > \textit{virtio_media_resp_mmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_mmap {
> > +    struct virtio_media_resp_header hdr;
> > +    u64 offset;
> > +    u64 len;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{offset}] offset into SHM region ID 0 of the start of the =
mapping.
> > +\item[\field{len}] length of the mapping as indicated by the
> > +\textit{struct v4l2_plane} the buffer belongs to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously
> > mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_munmap {
> > +    struct virtio_media_cmd_header hdr;
> > +    u64 offset;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{offset}] offset into SHM region ID 0 previously returned
> > +by \textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been
> > previously mapped.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with
> > \textit{virtio_media_resp_munmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_munmap {
> > +    struct virtio_media_resp_header hdr; }; \end{lstlisting}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP
> > +buffer}{Device Types / Media Device / Device Operation / Unmapping a
> > +MMAP buffer}
> > +
> > +The device MUST keep mappings performed using
> > +\textit{VIRTIO_MEDIA_CMD_MMAP} valid until
> > +\textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffers or
> > session they belong to are released or closed by the driver.
> > +
> > +\paragraph{Device Operation: Memory Types}
> > +
> > +The semantics of the three V4L2 memory types (\textit{MMAP},
> > +\textit{USERPTR} and \textit{DMABUF}) can easily be mapped to both dri=
ver
> > and device context.
> > +
> > +However, the driver shall only advertise support for \textit{MMAP} and
> > +\textit{DMABUF} to the guest userspace. \textit{USERPTR} is merely
> > +employed to discern \textit{GUEST_PAGES} buffers, similar to how
> > +\textit{DMABUF} is used to signify \textit{VIRTIO_OBJECT} buffers in t=
he
> > driver and device context.
> > +
> > +\subparagraph{MMAP}
> > +
> > +In virtio-media, \textit{MMAP} buffers are provisioned by the device,
> > +just like they are by the kernel in regular V4L2. Similarly to how
> > +userspace can map a \textit{MMAP} buffer into its address space using
> > +mmap and munmap, the virtio-media driver can map device buffers into
> > +the driver space by queueing the \textit{struct virtio_media_cmd_mmap}
> > +and \textit{struct virtio_media_cmd_munmap} commands to the
> > commandq.
> > +
> > +\subparagraph{GUEST_PAGES}
> > +
> Please change the notion from guest/host to device/driver respectively.

Ok. I'll change it to either SHARED_PAGES or DRIVER_PAGES,
to signify better that this memory is privisioned by the driver.

>
> > +In virtio-media, \textit{GUEST_PAGES} buffers are provisioned by the
> > +driver, and use guest physical addresses. Instances of \textit{struct
> > +v4l2_buffer} and \textit{struct v4l2_plane} of this type are followed
> > +by a list of \textit{struct virtio_media_sg_entry}. For more
> > +information, see \ref{sec:Device Types / Media Device / V4L2 ioctls /
> > +Userspace memory}
> > +
> > +The device must not alter the pointer values provided by the driver, i=
.e.
> > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > +\textit{struct v4l2_plane} must be returned to the driver with the sam=
e
> > +value as it was provided.
> > +
> > +\subparagraph{VIRTIO_OBJECT}
> > +
> > +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a
> > +virtio object, just like they are by a \textit{DMABUF} in regular V4L2=
.
> > +Virtio objects are 16-bytes UUIDs and do not fit in the placeholders
> > +for file descriptors, so they follow their embedding data structure as
> > +needed and the device must leave the V4L2 structure placeholder
> > unchanged.
> > +
> > +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be
> > +added in both the device-readable and device-writable section of the
> > descriptor chain.
> > +
> > +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory
> > type
> > +can also be exported as virtio objects for use with another virtio
> > +device using the \textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of
> > +\textit{v4l2_exportbuffer} means that space for the UUID needs to be
> > +reserved right after that structure
> > +
> > +\subsubsection{Event Virtqueue}
> > +
> > +Events are a way for the device to inform the driver about asynchronou=
s
> > +events that it should know about. In virtio-media, they are used as a
> > +replacement for the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT}
> > +ioctls and the polling mechanism, which would be impractical to implem=
ent
> > on top of virtio.
> > +
> > +\paragraph{Device Operation: Event header}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > +
> > +/* Header for events queued by the device for the driver on the eventq=
.
> > +*/ struct virtio_media_event_header {
> > +    u32 event;
> > +    u32 session_id;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> > +\item[\field{session_id}] ID of the session the event applies to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Device-side error}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> > +mentioned in the header is considered corrupted and automatically
> > +closed by the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_error {
> > +    struct virtio_media_event_header hdr;
> > +    u32 errno;
> > +    u32 __padding;
> > +};
> Mostly you wont need padding once you move to admin commands, but whereve=
r applicable, please convert into reserved field in the name.
> So, it can be used in future. Converting reserved to meaningful is doable=
 compared to padding constant bytes.
>

