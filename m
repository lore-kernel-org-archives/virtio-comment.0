Return-Path: virtio-comment-return-1059-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DCBE985DD2
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Feb 2020 11:51:00 +0000 (UTC)
Date: Wed, 12 Feb 2020 12:50:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200212115051.woveg4nxgd4f7o73@sirius.home.kraxel.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
 <20200207074033.172289-3-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200207074033.172289-3-stevensd@chromium.org>
Subject: [virtio-comment] Re: [RFC PATCH v3 2/2] virtio-gpu: add the ability to export
 resources
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Feb 07, 2020 at 04:40:33PM +0900, David Stevens wrote:
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  virtio-gpu.tex | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/virtio-gpu.tex b/virtio-gpu.tex
> index af4ca61..e950ad3 100644
> --- a/virtio-gpu.tex
> +++ b/virtio-gpu.tex
> @@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request header}\la=
bel{sec:Device Types / GPU De
>          VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300,
>          VIRTIO_GPU_CMD_MOVE_CURSOR,
> =20
> +        /* misc commands */
> +        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID =3D 0x0400,

I'd suggest to move that to the "2d commands" section (which isn't
really "2d" but more "not 3d").

We also need a feature flag signaling support for the new command.

Otherwise this looks ok to me.

Are there any patches and/or attempts to merge/discuss upstream?
Specifically for handling the uuids for dma-bufs in linux (guest side)?
I suspect there will be some discussions on this and having at least
some plan upstream can agree on would be good.

cheers,
  Gerd


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

