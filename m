Return-Path: <virtio-comment-return-3179-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4C11986371
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jun 2022 06:23:01 +0000 (UTC)
MIME-Version: 1.0
References: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
 <CACGkMEtX-tbROTsTNGjnNcsf8UCa4HYFZ_xonDGj8To3iWRMXQ@mail.gmail.com> <CAJs=3_BjukVkg7uo6xL31UbCjzFKa2DhnuMNu_unt3m9sCSd+Q@mail.gmail.com>
In-Reply-To: <CAJs=3_BjukVkg7uo6xL31UbCjzFKa2DhnuMNu_unt3m9sCSd+Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 Jun 2022 14:22:40 +0800
Message-ID: <CACGkMEtQ+2UtoTDeUM6bQfY8gECYji1LZeg5Rn9rP10dLqsQ7Q@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v7] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jun 23, 2022 at 8:04 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> Hi Jason,
>
> > Note that the keyword "SHOULD" must be used in the normative part.
>
> Please note that this is not the "Driver Requirements"/"Device
> Requirements" paragraph, but Coalescing and Notifications Suppression.
>
> > So instead of trying to partially duplicate the definition for
> > notification suppression, I wonder if we can simply remove this
> > example, and add references to the subsection that explains the
> > packet/split notification suppression in the first two examples?
>
> How about removing the "Coalescing and Notifications Suppression"
> paragraph, and replacing this line (from Device Requirements):
>
> "A device SHOULD NOT send notifications to the driver, if the
> notifications are suppressed."
>
> With:
>
> "A device SHOULD NOT send notifications to the driver if the
> notifications are suppressed, as explained in {reference to Used
> Buffer Notification Suppression}, even if the coalescing counters
> expired."
>
> What do you think?

Looks better.

Thanks

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

