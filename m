Return-Path: virtio-comment-return-1208-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09B819848B9
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 May 2020 14:38:44 +0000 (UTC)
Date: Mon, 4 May 2020 10:38:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200504103806-mutt-send-email-mst@kernel.org>
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200422005531.15085-2-gurchetansingh@chromium.org>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, kraxel@redhat.com, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Apr 21, 2020 at 05:55:30PM -0700, Gurchetan Singh wrote:
> Blob resources are size-based containers for host, guest, or
> host+guest allocations.  These resources are designed with
> mulit-process 3D support in mind, but also usable in virtio-gpu 2d
> with system memory allocation (also known as dumb allocation, but
> since that's reserved in a DRM/KMS world, went with system).
>=20
> Many hypercalls are reused, since a image view into the blob resource
> is possible.
>=20
> Blob resources are both forward and backward looking.
>=20
> Co-authored-by: Gerd Hoffman <kraxel@redhat.com>
> Co-authored-by: Chia-I-Wu <olvaffe@gmail.com>

Pls just use standard Signed-off-by.


> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  virtio-gpu.tex | 101 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>=20
> diff --git a/virtio-gpu.tex b/virtio-gpu.tex
> index e70532f..6f374bd 100644
> --- a/virtio-gpu.tex
> +++ b/virtio-gpu.tex
> @@ -36,6 +36,7 @@ \subsection{Feature bits}\label{sec:Device Types / GPU =
Device / Feature bits}
>  \item[VIRTIO_GPU_F_VIRGL (0)] virgl 3D mode is supported.
>  \item[VIRTIO_GPU_F_EDID  (1)] EDID is supported.
>  \item[VIRTIO_GPU_F_RESOURCE_UUID (2)] assigning resources UUIDs for expo=
rt to other virtio devices is supported.
> +\item[VIRTIO_GPU_F_RESOURCE_BLOB (3)] creating size-based blob resources=
 is supported.
>  \end{description}
> =20
>  \subsection{Device configuration layout}\label{sec:Device Types / GPU De=
vice / Device configuration layout}
> @@ -188,6 +189,7 @@ \subsubsection{Device Operation: Request header}\labe=
l{sec:Device Types / GPU De
>          VIRTIO_GPU_CMD_GET_CAPSET,
>          VIRTIO_GPU_CMD_GET_EDID,
>          VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
> +        VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
> =20
>          /* 3d commands (OpenGL) */
>          VIRTIO_GPU_CMD_CTX_CREATE =3D 0x0200,
> @@ -498,6 +500,105 @@ \subsubsection{Device Operation: controlq}\label{se=
c:Device Types / GPU Device /
>  other devices are not visible in the attached backing until they are tra=
nsferred
>  into the backing.
> =20
> +\item[VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB] Creates a virtio-gpu blob
> +  resource. Request data is \field{struct
> +  virtio_gpu_resource_create_blob}, followed by \field{struct
> +  virtio_gpu_mem_entry} entries. Response type is
> +  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
> +  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
> +
> +\begin{lstlisting}
> +#define VIRTIO_GPU_BLOB_MEM_GUEST             0x0001
> +#define VIRTIO_GPU_BLOB_MEM_HOST3D            0x0002
> +#define VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST      0x0003
> +#define VIRTIO_GPU_BLOB_MEM_HOSTSYS           0x0004
> +#define VIRTIO_GPU_BLOB_MEM_HOSTSYS_GUEST     0x0005
> +
> +#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
> +#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
> +#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> +
> +struct virtio_gpu_resource_create_blob {
> +       struct virtio_gpu_ctrl_hdr hdr;
> +       le32 resource_id;
> +       le32 blob_mem;
> +       le32 blob_flags;
> +       le32 nr_entries;
> +       le64 blob_id;
> +       le64 size;
> +};
> +
> +\end{lstlisting}
> +
> +A blob resource is a container for:
> +
> +  \begin{itemize*}
> +  \item a guest memory allocation (referred to as a
> +  "guest-only blob resource").
> +  \item a host memory allocation (referred to as a
> +  "host-only blob resource").
> +  \item a guest memory and host memory allocation (referred
> +  to as a "default blob resource").
> +  \end{itemize*}
> +
> +The memory properties of the blob resource MUST be described by
> +\field{blob_mem}, which MUST be non-zero.
> +
> +For default and guest-only blob resources, \field{nents} guest
> +system pages are assigned to the resource.  For default blob
> +resources, these guest pages are used for transfer operations.
> +
> +Host allocations depend on whether VIRTIO_GPU_F_VIRGL is supported.
> +If VIRTIO_GPU_F_VIRGL is not supported, then:
> +
> +  \begin{itemize*}
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS for host-on=
ly
> +  blob resources
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS_GUEST for
> +  default blob resources
> +  \end{itemize*}
> +
> +For the above above cases, host system memory is allocated by the device=
.
> +
> +If VIRTIO_GPU_F_VIRGL is supported, then:
> +
> +  \begin{itemize*}
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D for host-onl=
y
> +  blob resources
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST for
> +  default resources
> +  \end{itemize*}
> +
> +For the above cases, the virtio-gpu resource MUST be created from the
> +rendering context local object identified by the \field{blob_id}. The
> +actual allocation is done via VIRTIO_GPU_CMD_SUBMIT_3D.
> +
> +VIRTIO_GPU_BLOB_MEM_GUEST is valid regardless whether VIRTIO_GPU_F_VIRGL
> +is supported or not.
> +
> +The driver MUST inform the device if the blob resource is used for
> +memory access, sharing between driver instances and/or sharing with
> +other devices. This is done via the \field{blob_flags} field.
> +
> +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
> +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
> +resource. There is no restriction on the image/buffer view the driver
> +has on the blob resource.
> +
> +VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D, VIRTIO_GPU_CMD_SET_SCANOUT and
> +VIRTIO_GPU_CMD_RESOURCE_FLUSH MAY be used with blob resources as well,
> +subject to the following restrictions:
> +
> +  \begin{itemize*}
> +  \item the driver MUST have a 4-byte per pixel 2D image view of the
> +        blob resource.
> +  \item the device MUST have a 4-byte per pixel 2D image view of the
> +        blob resource, or create one if does not exist.
> +  \end{itemize*}
> +
> +For host-only blob resources, transfer operations MAY synchronize
> +caches.
> +
>  \end{description}
> =20
>  \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types /=
 GPU Device / Device Operation / Device Operation: controlq (3d)}
> --=20
> 2.24.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

