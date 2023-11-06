Return-Path: <virtio-comment-return-8176-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10D9C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:51:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 023EB2AEE3
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:51:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF39E9866FF
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:51:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B829D9866FB; Mon,  6 Nov 2023 03:51:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A87529866FC
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 03:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yn9WiDHyW/lEengyAR7s6Uv2vYt6w/tjhB79/kJuy1DbCPamq7hQx1J3yhImthvvyvd9NymlmBLxw3nuVp5wcPfUVeS/sjiBgXRmG9OY8MR672MtHBkQNzMluKDyoMlR87JhRkPBSfrFkUc+zScEvRIPAXzsVEM77sDXlyEAzoTkZnA+SrafKhK3bn6FPGYntn6cF0Q/J24NpA3YPNNz+mWNLpShUqc0moLY591Q8Lzr1oQb+ylZxjirRQAYtgQ/C5aHIvo1u9L/Wpkbw8L/3SCsz8Qnkn+0khPKt+0WhnwmlRWTQ7lmJ1DH6AJbztQQTx/civuEfYjjmfsq+COk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X6TG0Fmac4GpdEtU/XyoYH5fRnuPV5GCVgS8nt40VM=;
 b=EUy7CXvbckK40PS5AzgVMOv+tSeIa3v5/vhA2iCebTWQHFKjjydas8OQ+PzwAVC7WZit1oLDXfZ0H9hK8unVqS7liyiH6iU0GQuSMTXcK+8Sj9Mhn8/Dlk8XbFgJncx71DtIg5mc/eURhMlNR0aiTUY0TqIFc22zDKyKb/tSM8+W+DU903mzKtRDLg/DO5gUG2XZMwwxPm5vFTGwx4gFVQXXDNaY0MW8cQ8k9vOppPQ1NbPXtlZZH/TaRptrLBKEIz0ijAfB2/zFYM/Op2qsMb5p2WHma5gwawjxilW28jubYkoDnfq9HQNctwbxXNOuteK0QECneZGqvkwaM7OctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index: AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAA38fAIAAwP/w
Date: Mon, 6 Nov 2023 03:51:14 +0000
Message-ID:
 <PH0PR12MB5481026DDD7332E275571F34DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105111935-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231105111935-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB5075:EE_
x-ms-office365-filtering-correlation-id: ec889b1f-4a3e-4395-2da7-08dbde7ba005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VuXbItwlxdHW5yXW+Lx6Uut5nMZl4nCR7FazQUWdcJeV/i3xtadDFLLWT1SdWAhwjf/qQBYHeSSXGsKCOJYLcEIlnFld6W7ChmTkXKuinlrrM16ql7OON9kSnGJryYni/gGH+Nh2Cfg88AWp+1XjR9ARq/oHf9NJMKMNnYtRH9mxlF3P7WlrU8xfOKzoITLtvSJzbgkFnfZTc4C+4hH9Gg46wLsgYeJPJZrlNHqptSGGmyu2vofwgqBHu8bXWaA4g4iP3nrJh78g07fB5GDdbNAFve9Ya6j5a4LY+Hfu1BTqwZKVxTCqLfOC2fUVVUpl5RzJSFVMqH+OGa4THoAh66ijTmWH00k14IrKdHgi8SeTsbJhHq+N1+F34namIK8YR3NkszkYmuqzhT7Xtdze5u3olzr7cxy5NsclgITrda3qPznGjQcVHWscL9E8FvXMTCv1gwA9gRL/uCZ3wzjItjVPp+hR7zC9mr76Pw1PCm5+SAAxZPjkw6PR499TeWgIUm/dGiqBWV0zbG7NkDQVabD7S0jEQ+Pj56gPG0vs7D2piqzLz/GOZA/prLXWlpiV42OsNV3IQjWSP3XoLfmQz558kiJmVHpUu0u/R1ax3LtU+XBT0l9V6ebWoScV+LpvVf1wkAogVIH2ZmZNWAznBA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(55016003)(9686003)(7696005)(6506007)(478600001)(71200400001)(38100700002)(86362001)(122000001)(33656002)(5660300002)(41300700001)(4744005)(2906002)(66476007)(66446008)(64756008)(54906003)(26005)(66556008)(66946007)(38070700009)(52536014)(76116006)(316002)(6916009)(8936002)(8676002)(4326008)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mjOwM3et39wL2hv1MgCvC/dcXNguMwI2vOvOX8fC2qt0Gobd1FxVBELQ4Q9K?=
 =?us-ascii?Q?79y2BwEdGQmWDMkCl/5Z2KNyxZzwVnrVfxs0lWf6b6YKP19IaHfPEDitZMns?=
 =?us-ascii?Q?GlwkSxctaJarICVFslRk5Sov0Fl2vykDm6IO2zo7g+OJexG/UDWy6DftI9r2?=
 =?us-ascii?Q?PBu1QIsYZiISxz8JtoxX7eBZY8woTy++4eM4Y/IlqRf9rbvkiiBMSTYXABer?=
 =?us-ascii?Q?9JHbyb/eIBY0UEr1QPqcHS7DRKc1Hy+qkkaMk59ovOMeOKlipI/dXkhMN6+i?=
 =?us-ascii?Q?BvRkmwDkIZp2bhjhx9KpaPlJsPZ7KMgPjG10b98Ef1J0ZzW8Pni1NBhJASLQ?=
 =?us-ascii?Q?hBmjpLzyQt1TqRB95Ee6YvmnZkT+S0M+NALxFalGw9ZInwSBwGnXMkgmt48B?=
 =?us-ascii?Q?DlvLZUW8x5mnk2h5bx2M1kIiwrI51BzMdOB7sXOXTinL65nVwM0r647fB635?=
 =?us-ascii?Q?bdC3bmTMTWZvw8kPj3iiWMpQukrKxqTFLmaETM0FZaTDMdX6nEnorvSc3RD7?=
 =?us-ascii?Q?vK1cgRE5MoFlDDzGRHmlY5SwhGIggRceWqcrSvNkL8lnY2X9EgkfuytUDmMf?=
 =?us-ascii?Q?FfC2qPlpIXm9zyZrv1TP/8kDqhM94txjt3epAZf/3fquZgTNsiqLpolfgE0G?=
 =?us-ascii?Q?BJjIuxK+Qkf/qEfuismF9bdbLN4SdugA6PmZ6Sg/UrbJ5yrLIK2f78FVx7MK?=
 =?us-ascii?Q?9f9HSwFDj6feDISJy0333tYMWYT8Ah7q0vY2Ps1pJdTxz9iYoojFlMmoD8Nd?=
 =?us-ascii?Q?WLeLwkOX7YwzmpbR38cM4CYU3zReMq/8gHnAh8dxxnoTeaLo4RfohnT0eyzW?=
 =?us-ascii?Q?CKa/fdfOYWDEKU/v80CAdm9B+68V30mcfOPSLu66mZRjTzarsJ+yNKDI1C+/?=
 =?us-ascii?Q?XcDylA+ZLa1OF18fFeOGdRwJw+hJVhTAwr3x5rYvMVRUC7p9tiB1jH97DxEo?=
 =?us-ascii?Q?7VIR6HyfEm9ZNZ6aVY2E+prOzXBum9zuLLvtcEEC4Ol0nah8xhN6NTHod/Q1?=
 =?us-ascii?Q?wWGH6ldXEqnFVI2aJDkt2tvwicyfoOAf5PsLCpwZdTi/vGvK5MAHDleGOEl0?=
 =?us-ascii?Q?i5A0mFp+6Xx8R3laBQNgXMehyEa5lDtizSzI1qH/OnNJFY+fDM12U62omf8C?=
 =?us-ascii?Q?YWdO2aHiRsAV8pdXTUuq81gnL6LLQrfgUbCwYm5ayPGhCdE7F5NP3rb0bBif?=
 =?us-ascii?Q?D56h98zRSu7kDmJ3UjPcIDx6OAUwC9lDlVALSOeGEQk84xhb70N03uwtUMuz?=
 =?us-ascii?Q?IbvrehZQ9kZze8Yeo1eonWo0s3ave1p8qaVUrF0jTBh1X7LVsO50ZIgodFw8?=
 =?us-ascii?Q?H1SHmbeKgNC3cXiG7g1qXQmeTXvTOFNtn5u9ZzJZNsMT5pRsMeXz5HjTI2yn?=
 =?us-ascii?Q?PymHh3edzY13XIg4Qrl52+1tiV56hGr7uVix1JfJ19ymftHai1YnyULy8k9f?=
 =?us-ascii?Q?tqCbM0ZgDUdLpDUVxda1YtpFR0b8o0iWuKHjhQ2PZmY1srvi5hQ0hC+qvK32?=
 =?us-ascii?Q?Tm8FsBcMA54xKAKKxgnH3y9IUHfT2nkQximlKS9JksE2vP/rUfJ9twCEEYVO?=
 =?us-ascii?Q?fSWZPwRaLqB7dWKPBNc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec889b1f-4a3e-4395-2da7-08dbde7ba005
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 03:51:14.9840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0ssztzPYeNijG8PkKbDOzSuY4LRHquxoay0tXvJhPLiXycIf0Ud65jOZ9c16DNpbRY6+WIBgnV7Qpcn+uldkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5075
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Sunday, November 5, 2023 9:50 PM
>=20
> On Fri, Nov 03, 2023 at 11:35:03AM +0000, Parav Pandit wrote:
> > And you never commented with sheer ignorance.
>=20
> I think you mean ignoring here. ignorance is something else entirely.
I am sorry. You are right. I meant ignoring.

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

