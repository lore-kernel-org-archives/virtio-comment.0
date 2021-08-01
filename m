Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com> <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
 <20210801040146-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <2252630c-6ce6-2983-aaa3-5f248dbfec3c@nvidia.com>
Date: Sun, 1 Aug 2021 11:38:07 +0300
MIME-Version: 1.0
In-Reply-To: <20210801040146-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/1/2021 11:16 AM, Michael S. Tsirkin wrote:
> On Sun, Aug 01, 2021 at 01:53:10AM +0300, Max Gurtovoy wrote:
>>> And yes, it also allows you to unload the generic driver and load
>>> a vendor driver. Which can then go wild if it wants to - nothing
>>> we can or want to do about it.
>> I don't get your point.
> Talking about virtio admin interface (you are using a VQ now), it seems
> to include or be planned to include several unrelated features, which
> I'm not sure is appropriate and it sure makes review harder. I would
> advise focusing on hypervisor management features such as live migration
> etc, or some other subset. Also, there's overlap with existing
> functionality such as feature negotiation.

Only one feature is negotiated in the RFC and it's the admin virtq support.

You asked me to give examples for future features and I did. These 
features are not in the RFC.

So I don't understand what is hard to review. I've answered all the 
points you raised.

If I'll add Live Migration to the RFC we'll discuss it for months and 
then we'll discuss the admin queue interface again.

I don't want that. We already agreed to upstream first the Admin q 
interface.

Please don't change the order and make me run in cycles.

>
> Talking about vendor specific commands, I don't feel you demonstrated a
> need for these beyond what already exists in the spec. In particular it
> is unclear why there a need to layer vendor specific commands on top of
> virtio. Using the existing capability would work at the PCI level which
> seems more appropriate as vendor things are likely to be low level.

I did explain it.

Vendors might have their own special souse that might seems weird for 
the TC or maybe some internal management stuff that are not related to 
virtio, such as HW counters for example.

You're trying to address all the commands in one shut and then you ask 
the opposite to narrow it to minimal.

I did already all the needed work: sent an RFC for LM and send an RFC 
for new admin q with only 2 commands for us to have easy submission.

This RFC gives you all the flexibility to add Jason's stop/start queue 
commands in the future, Live migration RFC that I sent and all the 
features you'll ever think to add to virtio instead of creating a 
dedicated interface each time and run long review cycles.


>
> It might be a good idea to address these concerns in your next revision,
> narrowing the scope as much as possible and explaining the motivation
> for the new interfaces.

narrow to what ? we have only 2 classes here, come on.

>
> Thanks!
>

