Return-Path: <virtio-comment-return-9028-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0389C47DA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 01:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C43C2B051
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 01:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4BF3986882
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 01:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C1AF3985F82; Tue, 30 Jan 2024 01:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1EA7C986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 01:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706578510; x=1707183310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8X6LGODKHXpr68zJvSwIVg0AcQTu0zbs4K+Ixwt/exc=;
        b=dKwi+51uo0r8kWBRYBo9p4k5EMB1xMiaZOHgAq7P4GYrY7gCMdloF1rPa9akdro/Rw
         xCiMVVXGwt5A6EIxgGibGFeJAhclzxgQQYnWzgH3e27p2MMK/Tag30nYzar+tPGgeoTc
         bjtBzG8OLZ8N2gfBvGdmXVRFjsldq0wHvMitZTnt7gCyyVnQf+/q2dmU8iOjTme+o5XI
         q8U549Q7c/ltpBdl0bYPZcHwBb21W9Dfah+KERaYovL+MgMLcA6/Zl5oEvSAj1lW70YF
         84bwWjunfBP8i6a1RgSXIGl7xbG7PMS6L3Iv1gWK2xhThkY9MfX6dC61mDEQvX6L+Aqt
         4WWA==
X-Gm-Message-State: AOJu0YyMIQasboUzAKkmdIhDGivQ9tAS6Su9Pe3gi+defJ112vz1Ono+
	r9DVHBsQQfBqBcda7sZU9ohzeqkNjYgvqdLP5vTlK5wRP8zLmOJhCG6H1VgUgLED9D+1AUxTARE
	usQ==
X-Google-Smtp-Source: AGHT+IH5DC9YB26IfW2+sSIGrhFqGuHX+6v48JyElfxAYdr4YUjii3tcsUJrFWBrZUTr8L8W9SgGUA==
X-Received: by 2002:a05:6512:4010:b0:510:2e35:5e with SMTP id br16-20020a056512401000b005102e35005emr5018181lfb.49.1706578509823;
        Mon, 29 Jan 2024 17:35:09 -0800 (PST)
X-Received: by 2002:a05:6402:2915:b0:55f:7b9:36b7 with SMTP id
 ee21-20020a056402291500b0055f07b936b7mr94768edb.2.1706578509018; Mon, 29 Jan
 2024 17:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 29 Jan 2024 17:34:56 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
Message-ID: <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>, 
	Huang Rui <ray.huang@amd.com>, Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000d057a906101fc5d9"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000d057a906101fc5d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> Document new virtio-gpu protocol fence-passing feature that extends 3d
> submit command with support of in-fences which are passed from guest to
> host for waiting. This feature allows to offload waiting for in-fences
> from guest to host, where it can be done more efficiently.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/gpu/description.tex
> b/device-types/gpu/description.tex
> index 443524851a05..e5e23b5c9072 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU
> Device / Feature bits}
>    resources is supported.
>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest to ho=
st
> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
>  \end{description}
>
>  \subsection{Device configuration layout}\label{sec:Device Types / GPU
> Device / Device configuration layout}
> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
> (3d)}\label{sec:Device Types / GPU Dev
>
>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
>    Submit an opaque command stream.  The type of the command stream is
> -  determined when creating a context.
> +  determined when creating a context.  Request data is
> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field describe=
s
> +  the size of \field{cmd_data} array in bytes.  The \field{num_in_fences=
}
> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled, otherwi=
se
> +  \field{num_in_fences} is treated as zero.  The array of
> \field{in_fences}
> +  IDs is placed in between the \field{num_in_fences} field and the
> +  \field{cmd_data} array.  The \field{in_fences} array contains virtio-g=
pu
> +  \field{fence_id}'s corresponding to the out-fence IDs of a previous
> +  3d submits.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_cmd_submit {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 size;
> +        le32 num_in_fences;
> +        le64 in_fences[num_in_fences];
> +        u32 cmd_data[size/4];
> +};
> +\end{lstlisting}
>

Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?


>
>  \item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only
>    blob resource into an offset in the host visible memory region. Reques=
t
> --
> 2.43.0
>
>

--000000000000d057a906101fc5d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 28, 2024 at 11:12=E2=80=
=AFAM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">=
dmitry.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Document new virtio-gpu protocol fence-passing=
 feature that extends 3d<br>
submit command with support of in-fences which are passed from guest to<br>
host for waiting. This feature allows to offload waiting for in-fences<br>
from guest to host, where it can be done more efficiently.<br>
<br>
Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collab=
ora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
---<br>
=C2=A0device-types/gpu/description.tex | 22 +++++++++++++++++++++-<br>
=C2=A01 file changed, 21 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/device-types/gpu/description.tex b/device-types/gpu/descriptio=
n.tex<br>
index 443524851a05..e5e23b5c9072 100644<br>
--- a/device-types/gpu/description.tex<br>
+++ b/device-types/gpu/description.tex<br>
@@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU De=
vice / Feature bits}<br>
=C2=A0 =C2=A0resources is supported.<br>
=C2=A0\item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and<br>
=C2=A0 =C2=A0synchronization timelines supported.=C2=A0 Requires VIRTIO_GPU=
_F_VIRGL.<br>
+\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest to host=
<br>
+=C2=A0 for waiting supported.=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<br>
=C2=A0\end{description}<br>
<br>
=C2=A0\subsection{Device configuration layout}\label{sec:Device Types / GPU=
 Device / Device configuration layout}<br>
@@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq (3d)}\label{=
sec:Device Types / GPU Dev<br>
<br>
=C2=A0\item[VIRTIO_GPU_CMD_SUBMIT_3D]<br>
=C2=A0 =C2=A0Submit an opaque command stream.=C2=A0 The type of the command=
 stream is<br>
-=C2=A0 determined when creating a context.<br>
+=C2=A0 determined when creating a context.=C2=A0 Request data is<br>
+=C2=A0 \field{struct virtio_gpu_cmd_submit}.=C2=A0 The \field{size} field =
describes<br>
+=C2=A0 the size of \field{cmd_data} array in bytes.=C2=A0 The \field{num_i=
n_fences}<br>
+=C2=A0 field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled, othe=
rwise<br>
+=C2=A0 \field{num_in_fences} is treated as zero.=C2=A0 The array of \field=
{in_fences}<br>
+=C2=A0 IDs is placed in between the \field{num_in_fences} field and the<br=
>
+=C2=A0 \field{cmd_data} array.=C2=A0 The \field{in_fences} array contains =
virtio-gpu<br>
+=C2=A0 \field{fence_id}&#39;s corresponding to the out-fence IDs of a prev=
ious<br>
+=C2=A0 3d submits.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_gpu_cmd_submit {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr hdr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_in_fences;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fences[num_in_fences];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_data[size/4];<br>
+};<br>
+\end{lstlisting}<br></blockquote><div><br></div><div>Don&#39;t you need VI=
RTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?</div><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0\item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only<br>
=C2=A0 =C2=A0blob resource into an offset in the host visible memory region=
. Request<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000d057a906101fc5d9--
