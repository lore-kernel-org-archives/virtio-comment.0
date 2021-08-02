Return-Path: <virtio-comment-return-2120-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39FB4986276
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Aug 2021 14:34:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YQfxrGg0V9iyOD03@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
 <YQfxrGg0V9iyOD03@stefanha-x1.localdomain>
Date: Mon, 02 Aug 2021 16:34:09 +0200
Message-ID: <87a6lz29we.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Sun, Aug 01, 2021 at 02:46:13AM +0300, Max Gurtovoy wrote:
>> 
>> On 8/1/2021 1:17 AM, Michael S. Tsirkin wrote:
>> > On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
>> > > On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
>> > > > On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
>> > > > > On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>> > > > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>> > > > > > > Admin virtqueues will be used to send administrative commands to
>> > > > > > > manipulate various features of the device which would not easily map
>> > > > > > > into the configuration space.
>> > > > > > > 
>> > > > > > > The same Admin command format will be used for all virtio devices. The
>> > > > > > > Admin command set will include 4 types of command classes:
>> > > > > > > 1. The generic common class
>> > > > > > > 2. The transport specific class
>> > > > > > > 3. The device specific class
>> > > > > > > 4. The vendor specific class
>> > > > > > > 
>> > > > > > > The above mechanism will enable adding various features to the virtio
>> > > > > > > specification, e.g.:
>> > > > > > > 1. Format virtio-blk devices in various configurations (512B block size,
>> > > > > > >       512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
>> > > > > > > 2. Live migration management.
>> > > > > > > 3. Encrypt/Decrypt descriptors.
>> > > > > > > 4. Virtualization management.
>> > > > > > > 5. Get device error logs.
>> > > > > > > 6. Implement advanced vendor/device/transport specific features.
>> > > > > > > 7. Run device health test.
>> > > > > > > 8. More.
>> > I still don't really see what do all these things have in common?
>> 
>> I don't think you need to look on this in that direction.
>> 
>> This is a queue for administration.
>> 
>> Cornelia and Stefan already agreed on this approach.
>
> We're discussing these patches and I'm trying to understand what you're
> proposing. It's a bit early to say I've agreed to anything.

For the record, same for me.


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

