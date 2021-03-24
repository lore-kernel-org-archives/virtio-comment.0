Return-Path: virtio-comment-return-1792-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BD3D9865AF
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 15:07:06 +0000 (UTC)
References: <20210323154840.2504509-1-arseny.krasnov@kaspersky.com>
 <YFs/4hcX8nd7h2Jv@stefanha-x1.localdomain>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <1497578a-0bad-82f7-6b23-8726564f6e6d@kaspersky.com>
Date: Wed, 24 Mar 2021 18:07:01 +0300
MIME-Version: 1.0
In-Reply-To: <YFs/4hcX8nd7h2Jv@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [RFC PATCH v4] virtio-vsock: use C style defines for constants
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

Thank You for review!

On 24.03.2021 16:34, Stefan Hajnoczi wrote:
> On Tue, Mar 23, 2021 at 06:48:36PM +0300, Arseny Krasnov wrote:
>> This:
>> 1) Replaces enums with C style "defines", because
>>    use of enums is not documented, while "defines"
>>    are widely used in spec.
>> 2) Adds defines for some constants.
>>
>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>> ---
>>  virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
>>  1 file changed, 28 insertions(+), 26 deletions(-)
> Awesome, thanks!
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

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

