Return-Path: virtio-comment-return-997-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B610985EFE
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Dec 2019 13:42:53 +0000 (UTC)
Date: Wed, 18 Dec 2019 14:42:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20191218134246.up6nwpgfjouhehig@sirius.home.kraxel.org>
References: <20191218131151.177694-1-keiichiw@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191218131151.177694-1-keiichiw@chromium.org>
Subject: [virtio-comment] Re: [PATCH v2] content: Reserve device ID for video encoder and
 decoder device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, acourbot@chromium.org, alexlau@chromium.org, dmitry.sepp@opensynergy.com, egranata@google.com, posciak@chromium.org, stevensd@chromium.org, tfiga@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 18, 2019 at 10:11:51PM +0900, Keiichi Watanabe wrote:
> Reserve device ID 30 for video encoder device and 31 for video decoder de=
vice.

Hint: https://github.com/oasis-tcs/virtio-spec/blob/master/.github/PULL_REQ=
UEST_TEMPLATE.md

> +30         &   Video encoder device \\
> +\hline
> +31         &   Video decoder device \\
> +\hline

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


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

