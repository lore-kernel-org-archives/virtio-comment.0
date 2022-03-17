Return-Path: <virtio-comment-return-2823-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C81A49866E6
	for <virtio-comment@lists.oasis-open.org>; Thu, 17 Mar 2022 14:12:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <3040881.qp741xram0@silver>
References: <4735344.EBYxvr1mta@silver> <3040881.qp741xram0@silver>
Date: Thu, 17 Mar 2022 15:12:42 +0100
Message-ID: <87cziksm5h.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field "indirect_num"
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This new CCW configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>
> Bump CCW virtio revision to 3 and make the existence of this new
> field "indirect_num" dependant on revision 3.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>

(...)

> @@ -2581,12 +2583,17 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  struct vq_config_block {
>          be16 index;
>          be16 max_num;
> +        be32 indirect_num; /* since virtio-ccw rev. 3 */

Maybe make it max_indirect_num (to mirror max_num?)

>  };
>  \end{lstlisting}
>  
>  The requested number of buffers for queue \field{index} is returned in
>  \field{max_num}.
>  
> +Since revision 3, \field{indirect_num} exists, which is supposed to reflect the
> +Queue Indirect Size (i.e. the maximum length of indirect descriptor tables)
> +supported by device for this queue.

It still depends on the feature flag, though.

Maybe

"If revision 2 or lower is set, struct vq_config_block extends up to
\field{max_num}.

If revision 3 or higher is set, struct vq_config_block extends to
\field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
\field{indirect_max_num} contains the maximum Queue Indirect Size
(i.e. the maximum length of indirect descriptor tables) supported by the
device for this queue; otherwise, its contents are unpredictable."

> +
>  Afterwards, CCW_CMD_SET_VQ is issued by the driver to inform the
>  device about the location used for its queue. The transmitted
>  structure is
> @@ -2599,6 +2606,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>          be16 num;
>          be64 driver;
>          be64 device;
> +        be32 indirect_num; /* since virtio-ccw rev. 3 */
>  };
>  \end{lstlisting}
>  
> @@ -2607,6 +2615,10 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>  available area and used area for queue \field{index}, respectively. The actual
>  virtqueue size (number of allocated buffers) is transmitted in \field{num}.
>  
> +Since revision 3, \field{indirect_num} exists, which is supposed to reflect the
> +Queue Indirect Size (i.e. the maximum length of indirect descriptor tables)
> +supported by driver for this queue.

Similar to above:

"If revision 2 or lower is set, struct vq_info_block extends up to
\field{device}.

If revision 3 or higher is set, struct vq_info_block extends to
\field{indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
the Queue Indirect Size (i.e. the maximum length of indirect descriptor
tables) supported by the driver for this queue is transmitted in
\field{indirect_num}."


> +
>  \devicenormative{\paragraph}{Configuring a Virtqueue}{Virtio Transport Options / Virtio over channel I/O / Device Initialization / Configuring a Virtqueue}
>  
>  \field{res0} is reserved and MUST be ignored by the device.

We should include a device normative statement:

"The device MUST NOT offer VIRTIO_RING_F_INDIRECT_SIZE, unless at least
revision 3 is set, and therefore \field{max_indirect_num} respectively
\field{indirect_num} are available."


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

