Return-Path: <virtio-comment-return-8650-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12738C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:58:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 553B319090F
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:58:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 204C99863D6
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:58:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F36E998639C; Mon, 27 Nov 2023 12:58:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E56789863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 12:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G39yQ7FKL3vO3NqCkcO+/oM0H7FUlJ8T9qFj1imiaW8mLdPUKEjSwaFizHgtfZVa35DXkNgog/cnpntpPk693NW0WF+Ek2iZtRlkxRs/1XVHoUwYJzEI1GxrkeY4SIGILd41o4kpBuVVbsAvK7iG2VskAsrCURqRDdhEs37ba5oNboucNNUHBIzmgrHRofm/dYDzaILx3e226Ij3u9eJKj+XdsbL3wWmudDeTNcUCeSls0JQKghed+O5hBSIIohrZsRcjKOyfXFA/CoGw3jXT6E9j5rE8VgOpd9r0jqkbllZfgzRqzH+ZPsNrbhqs1CFe+mAypTLWUC2xZRnnIIHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IihWDg8Bg+iKSF9Kbmhojuqzi67Ti+8A6KGYJpFmD48=;
 b=FTebyBsZkFmQFW30tUGQSYaIVVZNeO4/FX2Yuka5EdRYVc9+wO6H/DnVFyCBZ86JAJh4wM+3dNC2ps84rfgXRmq1XmPk6S4MrhXIQ1iTKn6aLUlIWbgnBwsBv7ix3K6L8yPbGg+XlbMdi2Th54ja3Nyny5sNnn5UdPX0Hl1hA+IeAAYt928aI5y+AfspkapRmBIQ3q0z/rkIm+0/xLODwUSJUSgKiI+5pHbK0yDeeJn5haO/UADP67DJ8Cxuiek+rJMBOUhE/Z5zI0FG3MYhto8K4tJG+Z6I46o54/ypKEphtzBFAMRpC4Yu+kBxg80csWqYswz8mjgmfp9H441xcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAIJoCAAAhSgIAALSaAgAStofCAACoJgIAAACxwgAAcRgCAAACAkA==
Date: Mon, 27 Nov 2023 12:58:47 +0000
Message-ID:
 <PH0PR12MB548114532ADBB8E73F92E799DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124040545-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127060729-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EBEC8FA0A797D54D1FB1DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127074837-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127074837-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5109:EE_
x-ms-office365-filtering-correlation-id: 676dbea5-ddc1-49f7-af8b-08dbef489844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7ltepJc64ajjqX0bwHgoi+Aiv2NVFgc53W6V0oteMvfhumJmXEcfJvpPhyaKTV/pFSE6VMwKqrsNMMJ/9CvC5egmZd94cdElHqmBqJlGY9Xfnt7S6UEI5+4A4vYEDyyaFWrpQ89Ge8EUjMsVEmAUNaiahW8hn9r8i+Bjd+txe6rxFNV9OCEeSQxtHpuI8yySrPu/0eu7zYLcDm3UrLLe5JlRHAymWf708xl8Gx8Rpeju+UVfCZ6IBhrts/afNA8RizDolYrvbW9u+IX2rJzBd6gCJkqN/FCRmbhq6Pr3MazQg3FEywnrlPUGeHrD1Do9FbFfduLJ82BFJvZvEMXd0IvvUs5zTzIwZin48ivxuqXRDK4uEXQf6StRL6WDrGZR1b7fQgB9K7dWwX/86owuC/jEoh5MqM71Z+gwWOPUq8Yt92Y1cJEyzYH4jSgPmHXwRfqiNKOcjNMYwgIi5N77kKgv3WdNLvQ93KEc5JEYSRnq3hQt07mlyQT9zgsfEu42S+6yWWj23F4JMbf+FbHiWBYnkx1vXKBTiitZ8zrwZvC8LVy3x7Hx7xnd1nICtrxW8kD7h7KPetHAugA6W/8SjEZW216J/Lhd0ZPTOOgpft51GZ+ttOsupAbfwMrvwYl0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(52536014)(71200400001)(8936002)(8676002)(4326008)(9686003)(6506007)(7696005)(55236004)(66446008)(66556008)(66476007)(54906003)(66946007)(64756008)(76116006)(6916009)(316002)(478600001)(122000001)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(86362001)(26005)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFVySkJRbEtMWTU2WlFNS0liaFN4NWF4OGszM3A4a0owUXpCQkdPL0ZQWml6?=
 =?utf-8?B?VWZ5enpXTnUrU2phMzVLNjM4M2s3QVVnRkE3YnRxamlOdGZ2S2ZCRW5YckRN?=
 =?utf-8?B?YkpMSG1XSmFQVU9zUFFQV1UzSy9IOXIzZzRLSnBHOW1oVXlsRk9hMkV0OUNX?=
 =?utf-8?B?KzNBNm5JY281Y1ZkTFRnRXFuMnJSVFZiYmpOS0lwd1N5Z293aW1DS09MMEl0?=
 =?utf-8?B?clVxdWFLY1VkWGJtNEM2UHhQVm0zUXVpUFpTL2diRENsK3FNZkxvbTNnYVow?=
 =?utf-8?B?N2EvU1JBZHJ5TUgva09KU1kyLzhWS2pmblE4NG16OGxRWGdkWWFaaGxYdVhJ?=
 =?utf-8?B?cGZsU0ltVkI3aUY4dnBUYXVQYkllR2VUaW5KQTB4d1JZV3JmNDJHRFZ5ODFy?=
 =?utf-8?B?MVg5dzMyRmxpTDlJbVk4SUhvZklHd0hHbUhySE9qTFNyV2VhOTIzUDNMQVVi?=
 =?utf-8?B?RTJwTk1GVVAvK1dnZXU1ekFWSmJGT3hwNjIwYmZTa0d2ZDBucytCdHpmanpl?=
 =?utf-8?B?cTBwbjFQQWl1UzlpZGRlZXN0TFJZNHNEcTZJeCs4eFFia1Q5R2pDWVhJN3RU?=
 =?utf-8?B?a0E4ODEzT3hTdHZ1ZVBUL2JnU0NrSllGanNXUGhsaVM1cDcyRTd0OUZkUHdU?=
 =?utf-8?B?Nk5MS21NbVVPdzVzckhQUzBTWG95NFFOdVdSc1lJOGQrbnI1Y0pENXdZQWg5?=
 =?utf-8?B?ZXJJcXpZZmZ6M2NDMTdFREovNVU5WE81NnZCZXBMU3kxeG03ZkY3VTBDSnY1?=
 =?utf-8?B?SXdQMm1Md0lXZEhPbXZoVFlXTm5qWmc1aTRuekVyT1QzN3cvazhZQTBkb3N5?=
 =?utf-8?B?RWZtTnpzb2lvSHlPZGJhS005OHBjODZnTkdVUkNEVzRxYStQeDRudEZNYm9U?=
 =?utf-8?B?Vlh2M01kWGtUZTJjRmpBczc2VkxtRVNZUnJrM2szNWY2U1VWNHZsU0JaV3lh?=
 =?utf-8?B?K3N2VUkwV3Z1c0VmRHhhVVg2amlQSzJoU3E2S3l1dENiYi9PMmxWTmZ0ZWRG?=
 =?utf-8?B?RjMrRkV6eUk1TjcrQjZoMHNRcTNONUxDVVk3MFpCaUptSmFsUksvN2dpL1d1?=
 =?utf-8?B?RnZTcGdLeitoSDlOcDBkcHZRT3JCUUM1VnFtS3UxbjdHWTVNaXFpM0owditV?=
 =?utf-8?B?YXZBT0F2aEViRHRzdlFxOUhUWVBPRjdhdzRZQjZYNEJHV2s1QnZEZy9sUjVK?=
 =?utf-8?B?OVRHU2VpV1BWT3NmZ0g0aVloOEV0UGxPMmZOV3J3ZExoL3dZVXMwVnRPRmdP?=
 =?utf-8?B?YnBybnQxVG9MNkc4OUJKdEkxUnp2SVlKYnZidWNueXJrK3Jtbmx3OGVSbS9S?=
 =?utf-8?B?R3ovQjhuUFpTcFozNXdyYjgxUlpkb0RlekhmYlFMbGdkdDZjU2g5L1hLZ014?=
 =?utf-8?B?WU9hQW1ZRGlqdW1ySmFlajMrQlNiT2l0SFRQM2p2TEJCVW9CMDZtcGQyTU16?=
 =?utf-8?B?enZtOGVSNWVJeVROL3NYTzRHbVloeGp4bjJISXBIZDlvRHVCZlI3ci9kQm42?=
 =?utf-8?B?NVJkUW45R29MUmZIcHpIV0VsTm1nbXZkR3puYndLN1g3SU9Wa0pqVFE1eU41?=
 =?utf-8?B?NGpxcUpOZUxuSjZ2ckgzM2F5RTJHOE1IYXlyd3JaaXltMG1keHN3TDdFb0VF?=
 =?utf-8?B?TEFpOUNhenVydVdZcXlPc2VPMTduaUJScnoyYzM2VHE0Q0FMaEtocDVZN2lG?=
 =?utf-8?B?cHQxTHkweExUeWIwM04wb3NuY2t6NFRHUGJTVlRIQzQrek9VdWliSm96MWUw?=
 =?utf-8?B?NFlyUjM4dXQ4OEZhOHFOQTJnVFNEUDNqSVBQT3l5ZHd4WjV2eVJGSDBhN290?=
 =?utf-8?B?ekFCOUNJTUQ4V2FxWW1kcVNoVXRWaUFJY21aQXFuS215Kyt6WGNZdG12TGE4?=
 =?utf-8?B?YlVXSDN3cHlpZ2VPc1U2TE8wZVlkS29XKzNYL1lBcXlLUW9YRlFITHRDbnB3?=
 =?utf-8?B?VnByQkVqZEdFN3NKbnhtUVBoZVV3bVBGdWFGV0dBcUJRVzA0Ym92VGRnVTV6?=
 =?utf-8?B?Zk1NQjdqMWN2UG5ncmk4TnhDK2d4b2drcUp2M011UW0xY3Bnbmx0MkxxZWhn?=
 =?utf-8?B?WDBzZFBsL1l0cVczN2dCNzNRQTFOSk56elBZVDd0dkRCS1JJL25JS0hqK2po?=
 =?utf-8?Q?Vcew=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676dbea5-ddc1-49f7-af8b-08dbef489844
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 12:58:47.4147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXB8EjB7Jvr+Tf8Hms6+zadv3mEBj4XjlS0KxFYgUCjKFTNIcvnyFZ7xI0PBPyn4GE4k5TLYx372N+my7GaLZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1v
bmRheSwgTm92ZW1iZXIgMjcsIDIwMjMgNjoyMiBQTQ0KPiANCj4gT24gTW9uLCBOb3YgMjcsIDIw
MjMgYXQgMTE6MTI6NDdBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4gPiBG
cm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogTW9u
ZGF5LCBOb3ZlbWJlciAyNywgMjAyMyA0OjQwIFBNDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBOb3Yg
MjcsIDIwMjMgYXQgMTA6MTk6NDVBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBUaGUgYnJpZ2h0IGxpbmUgaW4gYmFzZWQgb24gdGhpcyB1c2FnZTog
Ym9vdHN0YXAgb3Igbm90Lg0KPiA+ID4gPiA+ID4gSWYgaXRzIHJ1bnRpbWUsIHN1cmUgaGF2ZSBp
dCBvdmVyIENWUS4NCj4gPiA+ID4gPiA+IEZvbGxvd2luZyB0aGUgbmljZSB0ZW5ldCBvZiBCLjIg
b2YgdGhlIHNwZWMgc25pcHBldDogIkRldmljZQ0KPiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbg0K
PiA+ID4gPiA+IHNwYWNlIHNob3VsZCBvbmx5IGJlIHVzZWQgZm9yIGluaXRpYWxpemF0aW9uLXRp
bWUgcGFyYW1ldGVycyINCj4gPiA+ID4gPiA+IFRoYXTigJlzIGl0Lg0KPiA+ID4gPiA+ID4gQW5k
IGV2ZXJ5b25lIGlzIGFscmVhZHkgYWxpZ25lZCB0byBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEFic29sdXRlbHkuIFNwZWNpZmljYWxseSwgd2hlbiBkbyB5b3UgZXhwZWN0IGRyaXZlciB0byBw
cm9iZQ0KPiA+ID4gPiA+IHRoZXNlIGNhcHM/IEFzIHlvdSB5b3Vyc2VsZiBleHBsYWluZWQsIGl0
IGhhcyB0byBkbyBpdCBiZWZvcmUNCj4gPiA+ID4gPiBldGh0b29sIGNhbGxzIC0gdGhhdCBjbGVh
cmx5IG1lYW5zIGl0IHdpbGwgZG8gaXQgaW4gcHJvYmUuDQo+ID4gPiA+ID4gVG8gbWUgdGhpcyBz
aW1wbHkgc2NyZWFtcyAiaW5pdGlhbGl6YXRpb24gdGltZSIuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
SXQgY2FuIGJlIGRvbmUgaW4gZHJpdmVyIHByb2JlIHJvdXRpbmUgYWZ0ZXIgRFJJVkVSX09LLCB0
aGlzIGlzIGZpbmUuDQo+ID4gPg0KPiA+ID4gTm8gLSBpdCBpcyBwcmVmZXJhYmxlIHRvIGRvIGl0
IGJlZm9yZSBEUklWRVJfT0sgYmVjYXVzZSBWUXMgYXJlDQo+ID4gPiBwcm9iZWQgYW5kIGluaXRp
YWxpemVkIGJlZm9yZSBEUklWRVJfT0suDQo+ID4gPiBGb3IgZXhhbXBsZSwgaXQgaXMgcmVhc29u
YWJsZSB0byBkZWNpZGUgdG8gb25seSBlbmFibGUgTVEgaWYNCj4gPiA+IHNwZWNpZmljIGZsb3cg
Y29udHJvbCBjYW4gbGF0ZXIgYmUgZW5hYmxlZC4NCj4gPg0KPiA+IEZvciBmbG93IGZpbHRlciBy
ZWxhdGVkIGNhcHMgaGFzIG5vIGhhcmQgZGVwZW5kZW5jeSB0byBpdCBiZWZvcmUgZHJpdmVyX29r
LA0KPiBzYW1lIGFzIHN0YXRzLg0KPiA+IE1RIGhhcyB1c2VycyBldmVuIHdpdGhvdXQgZmxvdyBm
aWx0ZXIuDQo+IA0KPiBkcml2ZXIgb2sgaXMgbm90IHRoZSBlbmQgb2YgZHJpdmVyIGluaXRpYWxp
emF0aW9uLiBUaGluZ3MgbGlrZSBwcmUtcG9wdWxhdGluZw0KPiByZWNlaXZlIHF1ZXVlcyBhcmUg
YWxzbyBwYXJ0IG9mIHRoYXQuDQoNClJxIHBvcHVsYXRpbmcgaXMgdW5yZWxhdGVkIGhlcmUuDQoN
Cj4gDQo+IFllcywgdGhlcmUgaXMgYSBkZXBlbmRlbmN5LiAgVGhlIGNhcGFiaWxpdHkgaXMgZWl0
aGVyIG5vdCB1c2VmdWwgYXQgYWxsIChhcyBpbiB0aGUNCj4gY3VycmVudCBmb3JtIC0gZHJpdmVy
IG1ha2VzIG5vIGRlY2lzaW9ucyBoZXJlIHNvIGl0IGlzIHBvaW50bGVzcykuIA0KSXQgaXMgbWFr
aW5nIGRlY2lzaW9ucyBiYXNlZCBvbiBncm91cCBhbmQgZmxvdyBpZCByYW5nZXMuDQpBcyBJIGFj
a2VkIGZldyB0aW1lcywgdGhhdCBub3JtYXRpdmUgbGluZXMgYXJlIG1pc3NpbmcgYW5kIEkgYW0g
aW4gbWlkZGxlIG9mIGFkZGluZyB0aGVtIGZvciB2Ny4NCg0KPiBPciBpdCB3aWxsIGJlDQo+IHVz
ZWZ1bCBhbmQgdGhlbiBpdCBoYXMgdG8gYmUgcHJvYmVkIGF0IGluaXQgdGltZSBzbyB0aGUgZGF0
YSBpcyBhdmFpbGFibGUgYXQNCj4gcnVudGltZSB3aGVuIGRlY2lzaW9ucyBhcmUgdG8gYmUgbWFk
ZS4gSG93ICpoYXJkKiBpcyB0aGlzIGRlcGVuZGVuY3k/DQpJdCBpcyB3cm9uZyBmb3IgbWUgdG8g
cHV0IHRoaXMgY2FwIGluIHRoZSBjb25maWcgc3BhY2Ugd2hpY2ggaXMgbm90IG5lZWRlZCBmb3Ig
dGhlIGRldmljZSBpbml0aWFsaXphdGlvbi4NCg0KPiBJIGRvbid0IGtub3cuIEkgZG8ga25vdyB0
aGF0IDEwMCUgb2YgZHJpdmVycyB3aWxsIGVpdGhlciBub3QgdXNlIHRoaXMgY29tbWFuZA0KPiBh
dCBhbGwgb3IgdXNlIGl0IGF0IGluaXQgdGltZS4NCg0KSSBkb27igJl0IHNlZSB3aXRob3V0IHRo
aXMgaG93IGRyaXZlciBjYW4gd29yayBhcyBpdCBkb2VzIG5vdCBrbm93IHRoZSB2YWxpZCBpZCBh
bmQgZ3JvdXAgcmFuZ2VzIHRvIHVzZS4NCg0KRHJpdmVyIGNhbiB1c2UgdGhpcyBjb21tYW5kIGF0
IGluaXQgdGltZSBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGRldmljZSB0byB0aGUgT1MuDQo=

