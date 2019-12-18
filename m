Return-Path: virtio-comment-return-998-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85DFE985EFE
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Dec 2019 14:08:38 +0000 (UTC)
MIME-Version: 1.0
References: <20191218131151.177694-1-keiichiw@chromium.org> <20191218134246.up6nwpgfjouhehig@sirius.home.kraxel.org>
In-Reply-To: <20191218134246.up6nwpgfjouhehig@sirius.home.kraxel.org>
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Wed, 18 Dec 2019 23:08:26 +0900
Message-ID: <CAD90VcbA0oGsV4gwNKTCtfnowrXEvc+PwiTwXyK3LNq6vU8NQw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v2] content: Reserve device ID for video encoder and
 decoder device
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, Dmitry Sepp <dmitry.sepp@opensynergy.com>, Enrico Granata <egranata@google.com>, Pawel Osciak <posciak@chromium.org>, David Stevens <stevensd@chromium.org>, Tomasz Figa <tfiga@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 18, 2019 at 10:42 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Dec 18, 2019 at 10:11:51PM +0900, Keiichi Watanabe wrote:
> > Reserve device ID 30 for video encoder device and 31 for video decoder =
device.
>
> Hint: https://github.com/oasis-tcs/virtio-spec/blob/master/.github/PULL_R=
EQUEST_TEMPLATE.md

Thanks for the info. I didn't understand the approval process.
I created https://github.com/oasis-tcs/virtio-spec/issues/67

Best,
Keiichi

>
> > +30         &   Video encoder device \\
> > +\hline
> > +31         &   Video decoder device \\
> > +\hline
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>

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

