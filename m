Return-Path: virtio-comment-return-1897-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6A1B986629
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Jun 2021 11:00:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210601172139.3725854-1-jiang.wang@bytedance.com>
References: <20210601172139.3725854-1-jiang.wang@bytedance.com>
Date: Thu, 10 Jun 2021 13:00:03 +0200
Message-ID: <87tum6yogc.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: fix a display for
 num_buffers
Content-Type: text/plain
To: Jiang Wang <jiang.wang@bytedance.com>, virtio-comment@lists.oasis-open.org
Cc: Jiang Wang <jiang.wang@bytedance.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jun 01 2021, Jiang Wang <jiang.wang@bytedance.com> wrote:

> One of num_buffers does not display correctly in
> the html. The _b becomes a subscript b. This will
> prevent it from being searched by using keyword num_buffers.
>
> Fix it by adding a field keyword.
>
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---
> v1 -> v2: use field keyword instead of adding an escape char.
>
>  content.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, pushed as an editorial update.


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

