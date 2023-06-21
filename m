Return-Path: <virtio-comment-return-6427-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EAEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 09:30:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BE48DEEA06
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 09:30:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A29309865B2
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 09:30:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8EBAE98653D; Wed, 21 Jun 2023 09:30:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7725C986546
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 09:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: pt6xxTdrPEq8meRzc31PKQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virtio-comment@lists.oasis-open.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Manos
 Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Harald Mommer <hmo@opensynergy.com>,
 Will Deacon <will@kernel.org>
In-Reply-To: <20230619120128.234244-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20230619120128.234244-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 21 Jun 2023 11:30:52 +0200
Message-ID: <87v8fh17sj.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rpmb: fix spec land mine in
 max_[wr|rd]_cnt

On Mon, Jun 19 2023, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Even if 0 meant no limit we are still limited by the field size of the
> request. That said for a maximum sized partition (* 80 128 1024) you
> could only actually request 40960 blocks before running out of device.
> Perhaps it would be better to mark 0 as invalid?

I don't think we can mark 0 as invalid, as it has been in a published
spec and implementations may be already using it.

That said, what is the actual limitation? Knowing nothing about RPMB, is
it 64k (what can fit in block_count), or the 40960 you mentioned above
as a value defined by other reasons (maximum size of a partition -- I
assume that cannot change?)

>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Harald Mommer <hmo@opensynergy.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  device-types/rpmb/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/device-types/rpmb/description.tex b/device-types/rpmb/descri=
ption.tex
> index 1dae3fd..2ce8a5b 100644
> --- a/device-types/rpmb/description.tex
> +++ b/device-types/rpmb/description.tex
> @@ -37,7 +37,7 @@ \subsection{Device configuration layout}\label{sec:Devi=
ce Types / RPMB Device /
>     The values MUST range between 0x00 and 0x80 inclusive.
>  \item[\field{max_wr_cnt and max_rd_cnt}] are the maximum numbers of RPMB
>     block count (256B) that can be performed to device in one request. 0 =
implies
> -   no limitation.
> +   no limitation other than the maximum value you can store in \field{bl=
ock_count} (65535).

So, I'm now wondering what these fields actually refer to. They are u8,
so obviously less than what fits into be16... are reads/writes limited
by anything else?

>  \end{description}
> =20
>  \devicenormative{\subsection}{Device Initialization}{Device Types / RPMB=
 Device / Device Initialization}


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

