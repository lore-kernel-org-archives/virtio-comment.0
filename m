Return-Path: <virtio-comment-return-2080-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6FDA9863D2
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jul 2021 15:46:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210722110903.8769-1-alex.bennee@linaro.org>
References: <20210722110903.8769-1-alex.bennee@linaro.org>
Date: Tue, 27 Jul 2021 17:45:53 +0200
Message-ID: <87czr34v66.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-rpmb: fix the description for
 multi-block reads
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, virtio-comment@lists.oasis-open.org
Cc: maxim.uvarov@linaro.org, joakim.bech@linaro.org, ulf.hansson@linaro.org, ilias.apalodimas@linaro.org, arnd@linaro.org, ruchika.gupta@linaro.org, tomas.winkler@intel.com, yang.huang@intel.com, bing.zhu@intel.com, Matti.Moell@opensynergy.com, hmo@opensynergy.com, Alex =?utf-8?Q?Benn?= =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 22 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Previously the text said we fail if block count is set to 1 despite
> language elsewhere in the text referring to:
>
>   "For RPMB read request, one virtio buffer including request command
>   and the subsequent [block_count] virtio buffers for response data
>   are placed in the queue."
>
> and the existence of both max_wr_cnt and max_rd_cnt configuration
> variables certainly implying devices should be able to handle
> multi-block reads just like writes.
>
> Fix the description as well as format the steps as an enumerated list
> to match the style of the previous section describing write handling.
>
> Reported-by: Ruchika Gupta <ruchika.gupta@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  virtio-rpmb.tex | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Do you want to request a vote for this?


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

