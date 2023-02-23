Return-Path: <virtio-comment-return-4474-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E21529865D0
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Feb 2023 08:26:32 +0000 (UTC)
Date: Thu, 23 Feb 2023 03:26:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230223032434-mutt-send-email-mst@kernel.org>
References: <20191112053748.1616272-1-yuri.benditovich@daynix.com>
 <20191112053748.1616272-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20191112053748.1616272-2-yuri.benditovich@daynix.com>
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: define support for
 receive-side scaling
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Nov 12, 2019 at 07:37:48AM +0200, Yuri Benditovich wrote:
> +Field \field{unclassified_queue} contains 0-based index of receive virtqueue to place unclassified packets in. Index 0 corresponds to receiveq1.
> +
> +Field \field{indirection_table} contains array of 0-based indices of receive virtqueus. Index 0 corresponds to receiveq1.

We have this "0 corresponds to receiveq1" in lots of places.
But what is unclear to me is which number corresponds to receiveq3.
Is this the virtqueue number - so vq 5? Or 3 - 1 = 2?

-- 
MST


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

