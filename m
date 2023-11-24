Return-Path: <virtio-comment-return-8605-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86300C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:41:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D199F339B9
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:41:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7B289868AC
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:41:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 96A819862D9; Fri, 24 Nov 2023 06:41:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 870799868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMWfiNaV5N8XqZNd7lHNqP2015a8Y5c8IpKT+WkVBCdPpXJsBqGNI3wuCWKI9lXxNF6XwMSvQiFfY1PuhqD9j9e3llz9xw3ZjK13QRn5aZB4hoJEhs/7Qcquhla1WI9DFc+9hGhpydpoYUxBA6hdDCxEWnv6li0nntBelew2ascca6zJEds0RGBhyN3jDvX+1NfQdctFXZXsiflQDOgHC6p9dW1Z2ZHJYU8GGarI4gSZ/vjhnvEmSy66NwOpMx2+Za0/NjUv+tFePTBA0hFzsShBCdzHPhSQW95uv/yTbvrDh4QlbtRggz7MgiO1O7EnDmtAk2BwUGUcRvDuYeykvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUN8oWNdD9EibbEYJg3Pi7oVx2KOrndOznaib+7DKgg=;
 b=BFMW9VddEgTEkdLbS4WF6bSk/dt5yfUMzJY9vb1tU0+59pDq2KkMmv+NKt8DfNL+AZ8igxZbsk+H2gI1oH/f8BMM0ui/MY1XjfkZN/A/yVcn5q3rJo9a13aj5Qrzi/q0/XdLKWG47MddQcK5qIWK/9u1Qz0FpfUQdPZVnPIAO6aZytYaUw5qkCGYorpwTN5v9cgULPbXorxEW7a7E9uRDRoztpFnmNtzX4xt9nLuxxAMAzKt+gva3dL2Hd9WCPOEgy0MG/cEAEt9hfzRZa6DNVjrJTYp/0eI+s+G8oRJBYeyK0GrXUSlDzTwvgdEO+Ge8ChKOOrNJ7LKmAcMydIb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAIJoCAAAhSgA==
Date: Fri, 24 Nov 2023 06:41:11 +0000
Message-ID:
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
In-Reply-To:
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH8PR12MB6747:EE_
x-ms-office365-filtering-correlation-id: 7fd2ee32-49b8-4905-054a-08dbecb85930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gPHDEMPygMQJK/kHMCx+XEPeVLluErWijgGZu/l9OUhpiTD7/OmaTnyRg2Qdb9DH3CxIf04TmJ94wao+5kKrb7+5hV9mNwgfvUONS0F+FCroqpYZxVGld1fshb9sQnNnRjirvhQS+hVvkAaQvKnh0qOF3jR8f0wUwBvCOKxsJEUeJIh5tCNSfp3heUe2wX0LG42dl5JzppGlZW8cFAfrfZh4604ZIZJacheIsK2tSOjl7nDZHk38vyV23fah4hQ4iQQIoKGo+c/AY3hEeQ3NUYQlLlB/AUlBFAdC1DTvtdasPfmCu3ooTcULRgh3gqsXgLKago+qwS1rtzFICUtoSLqou1iuvKXjgNPZpLVziez4BTeMmpq7DecYC+sdeXMhLySidbTU501n4Syi56J1Py58vRXEZEODSQpDNcAUNcPEs/pHrkA0N6Qw+NrtQ3odEHVXhTWJv5nLHKOmk2yz1VKNujynruDuehOXQo8EGberRV27CxKR9o2w7WvPtMWXL5yJT3YIOzUNF4R4SeLINshuJ6pWeKxHxk8DkN+QfmNtDu0UhjvKlcU9BTbV2CebzsbGCI7JQCSOryKqTK28VrjUo4yCPTddW6br77uq9biBBG3zQ+vnQTRszwXfu5Zn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(478600001)(71200400001)(55016003)(64756008)(2906002)(86362001)(52536014)(5660300002)(26005)(66946007)(66446008)(4326008)(33656002)(41300700001)(83380400001)(54906003)(6916009)(8676002)(316002)(66476007)(76116006)(8936002)(66556008)(7696005)(6506007)(9686003)(38070700009)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlZKcUNtK3Uxc0VwZEtmUFpJUDNqejVUSmF6dFcrQWRGSGc2WU9IU1paS3R4?=
 =?utf-8?B?bHZKTEhoaXg3M25SY0tWdG56RFI1LzNDVG5lMHlxQ3RsMk9DVHBoeTVLMHdz?=
 =?utf-8?B?NFRjNXpkQUVpOU5IUERXUmZxUEZKbkliUXl4K2pha3orZllmaC82eTlUdlBW?=
 =?utf-8?B?YkdBMnFRRXVFdEpCR0E5dEpBY3kzOVdORnBmM2g3VVl0UzBqRVcxS1Jtcnoz?=
 =?utf-8?B?SEo3OTFSa3MrSldFLzA0MFRGZVR1Z2YvL2dLSlUvNVdQRXBIMW5Xb0dBOXp3?=
 =?utf-8?B?TU1BNGRINXA4bnJuTFNkVVdUdTJlRytDYjVRZElMWjhVZ255K3hVck82Q0N4?=
 =?utf-8?B?WXlsOUFuTEtZbFRZVEZTL1FpK2l4bk9xZFVUZlB0ajVNK05NM1ZKYWxqUFA2?=
 =?utf-8?B?eDdLUUJqd2dTRWZRSkdsVTBBZGhqWHlkLzFqT1NyaDZ1QmhuVUFWTmFLLzM3?=
 =?utf-8?B?WHQ2Tkk0U3JibHExQUtkOFVucThVNk1aL2Q2UmhQaVRHV1I5RVRsWldTaXpa?=
 =?utf-8?B?UTl4YUVqUm9iSFJhMXB6NFozK0V0VExwQitOelhOVWtvWGZjMzJZWFY4bndM?=
 =?utf-8?B?SFZTNXR0ZU9sM29SUGxsZCtrUlY0YVRQQ0U3Qm1NT1pneDY0STVLWitReFBH?=
 =?utf-8?B?TCtCb0JnQnlZSHlRZ2tieEVla0oyazIwYnM4U1J3NkdwTlhMc0U1OWRtcVFs?=
 =?utf-8?B?bityOXdXLys2WjJ6L3ltYjVzZlFKUzVSK1Ivb0xWRktGK3Y3QkFDTDg3UkNo?=
 =?utf-8?B?ZVhOWnlaRW1yV1dQMm5VRHAxUXZ6b08yUmRWVmFWaTBxa0xDMmVEVWtUSEVQ?=
 =?utf-8?B?VWNVajBQMUFpTTJRcDlaY3ZtRkRMVGhzMU9KUUhXa29ndlJLT0w2cHhqRDAy?=
 =?utf-8?B?Y2pXcys3TmhrL0c5cjlkZlJMNWNpdWNVRzN6SVJQSTFGWWs1cGluZ2RCaWNj?=
 =?utf-8?B?ZWxWcnRaY0Q0RDdKaU5QL0JKZnVMOHYvL3Rwcml4a3RGVXk5YW0xWm9RWUNV?=
 =?utf-8?B?YTROWE5EMXRKSmZXR256TlhvS3cyOFRsUUxTWjNkaDIrdTVBYSs1YVNMN3k4?=
 =?utf-8?B?TmZEdFFwMDZRWTY3ZzQ4TFM0Kzk5ME1iU0ZUR243eml2ZU9xUjhYRHpZR1l1?=
 =?utf-8?B?NllyRWZBeHdUWXJ5d0VWZVgzczZlTmRuenFwcUx6MFZFZ0JRZTRaKy9LckVB?=
 =?utf-8?B?Y211U2tBVHVRbEpSSXp0d1JoZTI4VTJ6ZmN2WitCTHdyZUZTRVFROEFmOHdG?=
 =?utf-8?B?MTN6eHc3S2FSdEl0STNBWTk0cmdQaWd4RERVVldyMWRHTlo1dFIzTmlNRjRV?=
 =?utf-8?B?TGkyRmU2VzNaT2xCMVR2R3ZwU3hyL0NDYzFCeHFNQml1ZUN3K3RremtZOE9v?=
 =?utf-8?B?NkRPRisxQUxNd21aOE84Z3V6Zm1STzduWU5sdFJ0MVhlWGRTV2cydFNtRFNj?=
 =?utf-8?B?YUtKdkhPRlc2VzNIZ2tsYkMvWDlIdkxZZWdUOVRXWiswSlVRejVRVmVBTTZr?=
 =?utf-8?B?NW5xNU9lTjI0dDh4c0N4WHBBQ1BqU1FxVm5KSzhoYkRlajEzME9EQ282eGxm?=
 =?utf-8?B?NUszaWQ1RE90eUVsdEV2QzVyTDlkMDRjUVpxUCs3aHdPWjJ6d3N5UnlERVBt?=
 =?utf-8?B?Z25ENHIxWklNRm1URW1ZcTUvY09XZU1lZUdGSmRkVGIvK2VJcjFpdU9JcVln?=
 =?utf-8?B?SytDVHJwNTUyd25XalZ3VThWYVNMVlp4N0hxRGJpS0FyKzFuQXg4cUJHUjA0?=
 =?utf-8?B?R21nNTg3eVNDWHhpQmwzUm56eHV4UEh0V0grN0cvbGlCZ0lqK0R0SHRzK0Nw?=
 =?utf-8?B?K2ZBQndiYXZXVTluVzA3Y0NQMkxhTnVFcjdmU0RXU1FiRVltODhUM1hMdENq?=
 =?utf-8?B?UlFqRkwyaW5pOXFHcVV3QW1mZVZMa094WVhha2IzWFB6Q0R1SklLNGROL0FD?=
 =?utf-8?B?ZEZ2WWhuRDJvWVJrWmV6V3VWbGFQRmxxYW9tU0lLSlkxUjZlaStnU01JUXYz?=
 =?utf-8?B?STcvZ0ZEYXduVzRtTGpFUXhOWXlSU3NMUXl1Z2EwYnNOV0wwZElRY1NwaGI0?=
 =?utf-8?B?WVFxVzBUc2t1blhNa0FPK005dGtlUVljR2VhTlI3ZGNZV2pGV2ZReXRiaTBn?=
 =?utf-8?Q?V/ZM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd2ee32-49b8-4905-054a-08dbecb85930
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 06:41:11.6914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Z70kmSRNXuDmgNmCAV8e17miZZ5FSKW1BvhPCZ08aXpU50puC4PT1HXjCjd+n3ICIwrvVwgm4hNGKQoluq/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTm92ZW1iZXIgMjQsIDIwMjMgMTE6MzIgQU0NCg0KDQo+IEp1c3QgdG8gY2xhcmlmeSBteSBw
b2ludCwgd2hhdCdzIEknbSBzYXlpbmcgaXMNCj4gDQo+IDEpIEZvciBDVlEsIGl0IGlzIHVzZWQg
dG8gc2VuZCB0aGUgY29tbWFuZHMgdG8gdGhlIGRldmljZS4gSXQncyBub3QgZ29vZCB0byB1c2UN
Cj4gdHJhbnNwb3J0IHRvIHNlbmQgdGhvc2UgY29tbWFuZHMNClRoaXMgaXMgbm90IHdoYXQgaXMg
cHJvcG9zZWQuDQoNCkNWUSBpcyBwcm9wb3NlZCB0byBleGNoYW5nZSBjYXBhYmlsaXRpZXMgYW5k
IGNvbmZpZ3VyYXRpb24gYmV0d2VlbiBkcml2ZXIgYW5kIGRldmljZS4NCihub3QgdG8gdHJhbnNw
b3J0IHRvIHNlbmQgY29tbWFuZHMpDQoNCj4gMikgVGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UgaXMg
dGhlIHBsYWNlIHRvIGFkdmVydGlzZSB0aGUgY2FwYWJpbGl0aWVzLCBlLmcgd2hhdA0KPiBraW5k
IG9mIGNvbW1hbmRzIGNvdWxkIHRoZSBkZXZpY2UgYWNjZXB0Lg0KPiANCmFuZCBpdCBpcyBub3Qg
ZWZmaWNpZW50IGFuZCBub3QgdXNlZCBhbnltb3JlIHdpdGggMS4zIGFuZCBoaWdoZXIuDQpUaGV5
IGFyZSBleGNoYW5nZWQgdXNpbmcgc2luZ2xlIGdldC9zZXQgaW50ZXJmYWNlIHdoZXJlIGRldmlj
ZSBkb2VzIG5vdCBuZWVkIHRvIGRvIHNwZWNpYWwgY3Jvc3Mgc3luY2hyb25pemF0aW9uIGJldHdl
ZW4gd2hhdCBpcyBleHBvc2VkIHZpYSBpbnRlcmZhY2VfMSAoY29uZmlnIHNwYWNlKSBhbmQgY29u
dHJvbCB2aWEgaW50ZXJmYWNlXzIgKGN2cSkuDQoNCj4gMikgZG9lc24ndCBjb25mbGljdCB3aXRo
IDEpDQo+IA0KQ1ZRIGRvZXMgbm90IGNvbmZsaWN0IHdpdGggYW55dGhpbmcgYXMgaXQgc3RhbmRz
IHRvZGF5IGluIDEuMy4NCg0KPiBBbmQgd2UgYXJlIGRpc2N1c3NpbmcgdGhlIHByb3Zpc2lvbmlu
ZyB3aGljaCBpcyBtb3JlIGFib3V0IDIpIGJ1dCBub3QgMSkNCj4gaGVyZS4NClByb3Zpc2lvbmlu
ZyB3aWxsIHNldCB0aGUgZGV2aWNlIGFuZCBkZXZpY2Ugd2lsbCBydW4gYmFzZWQgb24gd2hhdCBp
cyBiZWluZyBzZXQuDQpJZiBNU0lYIGlzIHByb3Zpc2lvbmVkLCBpdCB3aWxsIHNob3cgdXAgaW4g
TVNJWCBhdHRyaWJ1dGUuDQpJZiB0aGUgQkFSIHJlZ2lvbiBzaXplIGlzIHByb3Zpc2lvbmVkIGl0
IHdpbGwgc2hvdyBpbiBQQ0kgTU1JTyBzaXplLg0KSWYgMS4zIGxlZ2FjeSBtYWMgYWRkcmVzcyBj
b25maWd1cmVkLCBzaG93cyB1cCBpbiB2aXJ0aW9fbmV0X2NvbmZpZy4NCmlmIDEuMyByc3MgY29u
ZmlndXJhdGlvbiwgc2hvd3MgdXAgaW4gdmlydGlvIG5ldCBjb25maWcNCg0KaWYgMS4zIHN0YXRz
IGNvbmZpZ3VyYXRpb24sIHNob3dzIHVwIGluIHN0YXRzLg0KSWYgMS40IGZsb3cgZmlsdGVycyBw
cm92aXNpb25lZCBzaG93cyBpbiBmbG93IGZpbHRlciBjYXBzLg0KDQpUaGUgcHJpbWFyeSB0ZW5l
dCBpczogY29uZmlnIHNwYWNlIGNvbnRhaW5zIG9ubHkgdGhlIG5lY2Vzc2FyeSBkcml2ZXIgYm9v
dHN0YXAgZmllbGRzLg0KVGhlIGJyaWdodCBsaW5lIGluIGJhc2VkIG9uIHRoaXMgdXNhZ2U6IGJv
b3RzdGFwIG9yIG5vdC4NCklmIGl0cyBydW50aW1lLCBzdXJlIGhhdmUgaXQgb3ZlciBDVlEuDQpG
b2xsb3dpbmcgdGhlIG5pY2UgdGVuZXQgb2YgQi4yIG9mIHRoZSBzcGVjIHNuaXBwZXQ6ICJEZXZp
Y2UgY29uZmlndXJhdGlvbiBzcGFjZSBzaG91bGQgb25seSBiZSB1c2VkIGZvciBpbml0aWFsaXph
dGlvbi10aW1lIHBhcmFtZXRlcnMiDQpUaGF04oCZcyBpdC4NCkFuZCBldmVyeW9uZSBpcyBhbHJl
YWR5IGFsaWduZWQgdG8gaXQuDQoNCj4gDQo+IFRoYXQncyBpdC4NCj4gDQo+IFRoYW5rcw0KPiAN
Cj4gDQo+ID4NCj4gPiA+IFdvcnN0IGNhc2UgZGV2aWNlcyBjYW4gbGllLCBpdCBpcyBub3QgY2xl
YXIgd29ycnlpbmcgYWJvdXQNCj4gPiA+IHN0YXRpc3RpY3Mgd2hlbiBwcm92aXNpb25pbmcgaXMg
aW1wb3J0YW50IGVub3VnaC4NCj4gPiBEZXZpY2Ugc3RhdGlzdGljcyBjYW5ub3QgYmUgYnJva2Vu
IHdoZW4gbWlncmF0aW5nLg0KPiA+DQo+ID4gPiBBbmQNCj4gPiA+IHlvdSBhcmUgbm93IHVuZGVy
IHRoZSBpbXByZXNzaW9uIGV2ZXJ5b25lIGdvdCBjb252aW5jZWQgd2hlbiBpbg0KPiA+ID4gcmVh
bGl0eSBldmVyeW9uZSBqdXN0IGdvdCB0aXJlZCBvZiBhcmd1aW5nLiBUaGlzIGlzIG5vdCBhIGdv
b2QgcGF0dGVybiB0byB0cnkNCj4gYW5kIHJlcGVhdC4NCj4gPiA+IExldCBtZSByZXBlYXQgdGhl
IHJlbGV2YW50IHBhcnQgaGVyZSBmb3INCj4gPiA+IHlvdToNCj4gPiA+DQo+ID4gPiAgICAgICBT
byB3aHkgc2hvdWxkbuKAmXQgd2UganVzdCBhZGQgc29tZSB0cmFuc3BvcnQgVlEgb24gdGhlIG93
bmVyDQo+ID4gPiBkZXZpY2UgdG8gdHJhbnNwb3J0IHRoZSBTSU9WIGRldmljZeKAmXMgY29uZmln
dXJhdGlvbj8NCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgIEFuczoNCj4gPiA+ICAgICAgICAg
ICAgICAgU3VjaCBhZGRpdGlvbiBtZWFucyB0aGF0IGhhcmR3YXJlIHZlbmRvcnMgbmVlZCB0bw0K
PiA+ID4gYnVpbGQgcnVudGltZSBjb25maWd1cmF0aW9ucyBpbiA0IGRpZmZlcmVudCB3YXlzLg0K
PiA+ID4gICAgICAgICAgICAgICBPbmUgd2F5IHVzaW5nIENWUSBmb3IgUENJIFBGIGFuZCBWRnMN
Cj4gPiA+ICAgICAgICAgICAgICAgMm5kIHdheSBhcyBiYWNrd2FyZCBjb21wYXRpYmxlIFNJT1Yg
dXNpbmcgb3duZXLigJlzDQo+ID4gPiBhZG1pbiBWUQ0KPiA+ID4gICAgICAgICAgICAgICAzcmQg
d2F5IHVzaW5nIFNJT1bigJlzIG93biBDVlEgY2hhbm5lbCBmb3IgVERJU1ANCj4gPiA+ICAgICAg
ICAgICAgICAgNHRoIHdheSB1c2luZyBtaXggb2YgYmFja3dhcmQgY29tcGF0aWJsZSBhbmQgc2Vj
dXJlDQo+ID4gPiBhbmQgZWZmaWNpZW50IHdheSB1c2luZyAjMiBhbmQgIzMuDQo+ID4gPg0KPiA+
ID4NCj4gPiA+IFRoaXMgaXMganVzdCBhIHN0cmF3LW1hbiBhcmd1bWVudC4gTm8gLSB3ZSBtYWtl
IGEgY2FwYWJpbGl0eQ0KPiA+ID4gb3B0aW9uYWwsDQo+ID4gQ2FwYWJpbGl0aWVzIGFyZSBub3Qg
b3B0aW9uYWwuDQo+ID4gVGhlIGRlc2lnbiBoYXMgdW5kZXJnb25lIGNhcmVmdWxseSByZXZpZXcg
dG8gZW5zdXJlIHRoYXQgZHJpdmVyIGhvbm9ycyB0aGUNCj4gY2FwYWJpbGl0eSwgYW5kIGl0IGlz
IG1pZ3JhdGFibGUgYm90aC4NCj4gPg0KPiA+IFlvdSBkaW50IGV4cGxhaW4gd2h5IGNhcGFiaWxp
dHkgc2hvdWxkIGJlIG9wdGlvbmFsLg0KPiA+IFRoZSBmaXJzdCBwYXRjaCBoYXMgZGVmaW5lZCBo
b3cgdGhlIGNhcGFiaWxpdGllcyBhcmUgdXNlZCBieSB0aGUgZHJpdmVyLg0KPiA+DQo+ID4gPiB3
ZQ0KPiA+ID4gc3Ryb25nbHkgc3VnZ2VzdCB0aGF0ICpkcml2ZXJzKiBzdXBwb3J0IGJvdGggb2xk
IGFuZCBuZXcgbWVjaGFuaXNtLA0KPiA+ID4gYW5kIHRoZW4gKmRldmljZXMqIHdpbGwgb25seSBp
bXBsZW1lbnQgd2hhdCdzIHJlcXVpcmVkLg0KPiA+IFRoZXJlIGFyZSBvdGhlciBleGFtcGxlcyBp
biB0aGUgc2FtZSBkb2N1bWVudCB0aGF0IG1ha2VzIHRoaW5ncyB3b3JzdA0KPiB3aXRoIG9sZCBh
bmQgbmV3Lg0KPiA+DQo+ID4gQWxzbyB0aGVyZSBpcyBsaXRlcmFsbHkgbm8gd2F5IHRvIGVuZm9y
Y2UgdGhhdCBkcml2ZXIgc3VwcG9ydHMgYm90aCBhbmQgbmV3LiBJdA0KPiBpcyBqdXN0IHNvdW5k
cyBsaWtlIGFuIGV4Y3VzZSB0byBmb3JjZSBpbmZpbml0ZSBjb25maWcgc3BhY2UuDQo+ID4NCj4g
PiBUaGUgbWV0aG9kIHByb3Bvc2VkIGhlcmUgaXMgZWxlZ2FudCBhbmQgY2xlYXJseSBwcm9tb3Rl
IG9uZSB3YXkgdG8gZG8NCj4gdGhpbmdzIGZvciBkcml2ZXIgYW5kIGRldmljZSB3aXRoIHByZWRp
Y3RhYmlsaXR5Lg0KPiA+DQo+ID4NCg0K

