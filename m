Return-Path: virtio-comment-return-1310-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 066B0985E91
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Jun 2020 21:43:00 +0000 (UTC)
MIME-Version: 1.0
References: <20200518184629.684-1-gurchetansingh@chromium.org> <20200528083421.lj5bmrrf2vtcxaac@sirius.home.kraxel.org>
In-Reply-To: <20200528083421.lj5bmrrf2vtcxaac@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 5 Jun 2020 14:42:44 -0700
Message-ID: <CAAfnVBn9terg_qDt76_QKaofUvPHuS6N1S3Q4MyEzS0U+X9Uug@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v4 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset="UTF-8"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, May 28, 2020 at 1:34 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, May 18, 2020 at 11:46:28AM -0700, Gurchetan Singh wrote:
> > Blob resources are size-based containers for host, guest, or
> > host+guest allocations.  These resources are designed with
> > mulit-process 3D support in mind, but also usable in virtio-gpu 2d
> > with guest memory.
> >
> > Many hypercalls are reused, since a image view into the blob resource
> > is possible.
> >
> > Blob resources are both forward and backward looking.
> >
> > v2: Add TRANSFER_BLOB, SET_SCANOUT_BLOB, SCANOUT_FLUSH
> > v3: Remove SCANOUT_FLUSH and add notes
> > v4: Remove TRANSFER_BLOB for now.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>
> Both patches look good to me.
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
> See .github/PULL_REQUEST_TEMPLATE.md (in the virtio-spec repo) for the
> merge process.

Thanks, will do after UUID patches land in virtio-spec / drm-misc-next!

>
> take care,
>   Gerd
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

