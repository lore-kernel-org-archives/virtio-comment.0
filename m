Return-Path: virtio-comment-return-761-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4CE5F98437C
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jun 2019 15:25:25 +0000 (UTC)
Date: Mon, 24 Jun 2019 11:25:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190624112055-mutt-send-email-mst@kernel.org>
References: <20190624083842.5921-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624083842.5921-1-ybettan@redhat.com>
Subject: [virtio-comment] Re: [PATCH] Added instructions to install latex to README.md.
To: Yoni Bettan <ybettan@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, ailan@redhat.com, ehabkost@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jun 24, 2019 at 11:38:42AM +0300, Yoni Bettan wrote:
> Signed-off-by: Yoni Bettan <ybettan@redhat.com>


> ---
>  README.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 3de0c1e..06f3563 100644
> --- a/README.md
> +++ b/README.md
> @@ -62,6 +62,12 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  <p>
>  git send-email --to=virtio-comment@lists.oasis-open.org proposal1/0001-*
>  </code>
> +<br><br>
> +To do so you will need to install latex in order to compile the spec.

sorry to do what?
latex is needed in order to generate pdf and html, but above text
does not mention this at all.

Maybe we should mention compiling above, but as long as we don't
this patch does not make sense.

> +For fedora user use:

user use sounds weird :)


> +<code>
> +sudo dnf install texlive-scheme-full
> +</code>

Sounds good but how about a couple more distros?

>  <h4>Note for TC Members</h4>
>  <p>TC Members should review TC specific
>  process rules under "Further Description of this Repository"
> -- 
> 2.21.0

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

